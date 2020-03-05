//
//  SearchMeaningsViewOutput.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

protocol SearchMeaningsViewOutput {
    func viewLoaded()
    func searchTextChanged(word: String)
    func didSelectWord(word: Word)
    func endReached()
}
