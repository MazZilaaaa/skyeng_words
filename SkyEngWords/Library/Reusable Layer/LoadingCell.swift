//
//  LoadingCell.swift
//  SkyEngWords
//
//  Created by Alexandr Fadeev on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class LoadingCell: UITableViewCell {
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!

    func configure() {
        activityIndicator.startAnimating()
    }
}
