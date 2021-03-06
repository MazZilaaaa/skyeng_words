//
//  Meaning.swift
//  SkyEngWords
//
//  Created by Alexandr on 04.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

struct Meaning: Codable {
    let id: Int?
    let partOfSpeechCode: String?
    let translation: Translation?
    let transcription: String?
    let previewUrl: String?
    let imageUrl: String?

    var previewImageUrl: URL? {
        guard let previewUrl = previewUrl else {
            return nil
        }

        return URL(string: "https:\(previewUrl)")
    }
}
