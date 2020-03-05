//
//  Word.swift
//  SkyEngWords
//
//  Created by Alexandr on 04.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

struct Word: Codable {
    let id: Int?
    let text: String?
    let meanings: [Meaning]?
}
