//
//  SearchMeaningsPresenter.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Dispatch

final class SearchMeaningsPresenter: SearchMeaningsViewOutput, SearchMeaningsModuleInput {

    // MARK: - Properties

    weak var view: SearchMeaningsViewInput?
    var router: SearchMeaningsRouterInput?
    var output: SearchMeaningsModuleOutput?
    var service: IWordsService?

    var currentPage = 0
    var pageSize = 20
    var hasOtherItems = true
    var items = [Word]()
    var searchingWord: String?
    var isLoading = false

    var searchingWorkItem: DispatchWorkItem?

    // MARK: - SearchMeaningsViewOutput

    func viewLoaded() {
        view?.setState(state: .success)
        view?.setTitle(title: "words")
    }

    func searchTextChanged(word: String) {
        searchingWorkItem?.cancel()
        searchingWord = word
        items.removeAll()
        view?.setWords(words: items)
        guard let searchingWord = searchingWord, !searchingWord.isEmpty else {
            return
        }

        let currentWorkItem = DispatchWorkItem {
            self.search(by: searchingWord, initially: true)
        }

        searchingWorkItem = currentWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2,
                                      execute: currentWorkItem)
    }

    func loadMoreSearchResults() {
        if let searchingWord = searchingWord, !isLoading {
            self.search(by: searchingWord)
        }
    }

    func didSelectWord(word: Word) {
        router?.showDetailWordModule(with: word)
    }

    private func search(by word: String, initially: Bool = false) {
        guard hasOtherItems || initially else {
            return
        }

        isLoading = true
        view?.setState(state: .loading)
        let nextPage = initially ? 0 : currentPage + 1
        print("find by \(word)")
        service?.fetchWords(word: word, page: nextPage, pageSize: pageSize, { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let words):
                print("success by \(word)")
                self.hasOtherItems = words.count == self.pageSize
                self.currentPage = nextPage
                self.items.append(contentsOf: words)
                self.view?.setState(state: .success)
                self.view?.setWords(words: self.items)
                self.isLoading = false
            case .failure(let error):
                switch error {
                case .canceled:
                    break
                default:
                    self.view?.setState(state: .failed)
                    self.isLoading = false
                }
            }

        })
    }

    // MARK: - SearchMeaningsModuleInput

}
