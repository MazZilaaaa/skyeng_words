//
//  WordsViewAdapterOutput.swift
//  SkyEngWords
//
//  Created by Alexandr Fadeev on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol WordsViewAdapterOutput {
    func didSelectWord(word: Word)
    func endReached()
}
