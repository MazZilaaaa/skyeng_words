//
//  WordService.swift
//  SkyEngWords
//
//  Created by Alexandr Fadeev on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

class WordsService: FetchService, IWordsService {
    func fetchWords(
        word: String,
        page: Int,
        pageSize: Int,
        _ completion: @escaping (Result<[Word], ServiceError>) -> Void) {
        fetch(.searchWords(searchString: word, offset: page, limit: pageSize), completion)
    }
}
