//
//  SearchWordsPresenter.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

final class SearchWordsPresenter: SearchWordsViewOutput, SearchWordsModuleInput {

    // MARK: - Properties

    weak var view: SearchWordsViewInput?
    var router: SearchWordsRouterInput?
    var output: SearchWordsModuleOutput?

    // MARK: - SearchWordsViewOutput

    // MARK: - SearchWordsModuleInput

}
