//
//  DetailWordViewController.swift
//  SkyEngWords
//
//  Created by Alexandr on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

final class DetailWordViewController: UIViewController,
    DetailWordViewInput,
    ModuleTransitionable,
    MeaningsViewAdapterOutput {

    var output: DetailWordViewOutput?
    var dataSource: MeaningsDataSource?
    @IBOutlet weak private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = MeaningsDataSource(output: self)
        dataSource?.configure(tableView: tableView)
        output?.viewLoaded()
    }

    func configure(with word: Word) {
        title = word.text
        if let meanings = word.meanings {
            dataSource?.items = meanings
        }
    }

    func didSelectMeaning(meaning: Meaning) {
    }
}
