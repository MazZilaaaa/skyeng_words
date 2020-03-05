//
//  MeaningTableViewCell.swift
//  SkyEngWords
//
//  Created by Alexandr on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class MeaningTableViewCell: UITableViewCell {

    @IBOutlet weak private var previewImageView: UIImageView!
    @IBOutlet weak private var translateLabel: UILabel!
    @IBOutlet weak private var noteLabel: UILabel!
    func configure(with meaning: Meaning) {
        translateLabel.text = meaning.translation?.text
        noteLabel.text = meaning.translation?.note
        previewImageView.byUrl(url: meaning.previewImageUrl)
    }
}
