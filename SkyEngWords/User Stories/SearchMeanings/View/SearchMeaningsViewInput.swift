//
//  SearchMeaningsViewInput.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

protocol SearchMeaningsViewInput: class {
    func setState(state: LoadingState)
    func setWords(words: [Word])
}
