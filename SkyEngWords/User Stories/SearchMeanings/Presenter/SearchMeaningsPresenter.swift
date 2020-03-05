//
//  SearchMeaningsPresenter.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

final class SearchMeaningsPresenter: SearchMeaningsViewOutput, SearchMeaningsModuleInput {

    // MARK: - Properties

    weak var view: SearchMeaningsViewInput?
    var router: SearchMeaningsRouterInput?
    var output: SearchMeaningsModuleOutput?
    var service: IWordsService?

    var page = 0
    var pageSize = 20
    var items = [Word]()
    var searchingWord: String?
    var isLoading = false

    // MARK: - SearchMeaningsViewOutput

    func viewLoaded() {
        view?.setState(state: .success)
        view?.setTitle(title: "words")
    }

    func searchTextChanged(word: String) {
        searchingWord = word
        page = 0
        items.removeAll()
        loadWords()
    }

    func loadMoreSearchResults() {
        page += 1
        loadWords()
    }

    func didSelectWord(word: Word) {
    }

    private func loadWords() {
        guard !isLoading else {
            return
        }
        guard let searchingWord = searchingWord, !searchingWord.isEmpty else {
            view?.setState(state: .success)
            view?.setWords(words: [])
            return
        }

        view?.setState(state: .loading)
        isLoading = true
        service?.fetchWords(word: searchingWord, page: page, pageSize: pageSize, { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let words):
                self.items.append(contentsOf: words)
                self.view?.setState(state: .success)
                self.view?.setWords(words: self.items)
            case .failure(let error):
                print(error.localizedDescription)
                self.view?.setState(state: .failed)
            }

            self.isLoading = false
        })
    }

    // MARK: - SearchMeaningsModuleInput

}
