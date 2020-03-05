//
//  UIImageView+ByUrl.swift
//  SkyEngWords
//
//  Created by Alexandr on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func byUrl(url: URL?) {
        if let url = url {
            self.kf.indicatorType = .activity
            self.kf.setImage(
                with: url,
                options: [.transition(.fade(0.3))])
        }
    }
}
