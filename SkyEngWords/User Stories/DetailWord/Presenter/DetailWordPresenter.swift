//
//  DetailWordPresenter.swift
//  SkyEngWords
//
//  Created by Alexandr on 05/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

final class DetailWordPresenter: DetailWordViewOutput, DetailWordModuleInput {

    // MARK: - Properties

    weak var view: DetailWordViewInput?
    var router: DetailWordRouterInput?
    var output: DetailWordModuleOutput?
    var word: Word

    init(word: Word) {
        self.word = word
    }

    // MARK: - DetailWordViewOutput

    func viewLoaded() {
        view?.configure(with: word)
    }

    // MARK: - DetailWordModuleInput

}
