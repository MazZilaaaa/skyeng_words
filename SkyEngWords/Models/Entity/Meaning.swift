//
//  Meaning.swift
//  SkyEngWords
//
//  Created by Alexandr on 04.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

struct Meaning: Decodable {
    let id: Int?
    let partOfSpeechCode: String?
    let translation: Translation?
    let previewUrl: String?
    let imageUrl: String?
}
