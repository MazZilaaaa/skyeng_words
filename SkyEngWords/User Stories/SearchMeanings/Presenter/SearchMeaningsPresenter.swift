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

    // MARK: - SearchMeaningsViewOutput

    // MARK: - SearchMeaningsModuleInput

}
