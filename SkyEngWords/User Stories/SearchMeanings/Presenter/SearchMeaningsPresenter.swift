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

    // MARK: - SearchMeaningsViewOutput

    func viewLoaded() {
        view?.setState(state: .success)
    }

    func search(word: String) {
        if word.isEmpty {
            self.view?.setWords(words: [])
            return
        }

        view?.setState(state: .loading)
        service?.fetchWords(word: word, { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let words):
                self.view?.setState(state: .success)
                self.view?.setWords(words: words)
            case .failure(let error):
                print(error.localizedDescription)
                self.view?.setState(state: .failed)
            }
        })
    }

    func didSelectWord(word: Word) {
    }

    // MARK: - SearchMeaningsModuleInput

}
