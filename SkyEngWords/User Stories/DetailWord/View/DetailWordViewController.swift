//
//  DetailWordViewController.swift
//  SkyEngWords
//
//  Created by Alexandr on 05/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

final class DetailWordViewController: UIViewController, DetailWordViewInput, ModuleTransitionable {
    

    // MARK: - Properties

    var output: DetailWordViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    // MARK: - DetailWordViewInput
    func configure(with word: Word) {
    }

}
