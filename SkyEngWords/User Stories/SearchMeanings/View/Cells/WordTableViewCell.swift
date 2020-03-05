//
//  WordTableViewCell.swift
//  SkyEngWords
//
//  Created by Alexandr Fadeev on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class WordTableViewCell: UITableViewCell {
    @IBOutlet weak private var wordLabel: UILabel!
    @IBOutlet weak private var firstMeaningLabel: UILabel!
    @IBOutlet weak private var meaningsCountLabel: UILabel!

    func configure(word: Word) {
        wordLabel?.text = word.text
        guard let meanings = word.meanings else {
            return
        }

        firstMeaningLabel?.text = meanings[0].translation?.text
        meaningsCountLabel?.text = String(meanings.count)
    }
}
