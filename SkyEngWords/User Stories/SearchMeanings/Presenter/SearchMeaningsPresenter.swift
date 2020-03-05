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
    var hasOtherItems = true
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
        hasOtherItems = true
        items.removeAll()
        view?.clearWords()
        loadWords()
    }

    func loadMoreSearchResults() {
        loadWords()
    }

    func didSelectWord(word: Word) {
        router?.showDetailWordModule(with: word)
    }

    private func loadWords() {
        guard hasOtherItems, !isLoading else {
            return
        }
        guard let searchingWord = searchingWord, !searchingWord.isEmpty else {
            view?.setState(state: .success)
            view?.clearWords()
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
                self.hasOtherItems = words.count == self.pageSize
                self.page = self.hasOtherItems ? self.page + 1 : self.page
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
