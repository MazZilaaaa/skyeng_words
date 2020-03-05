//
//  WordsDataSource.swift
//  SkyEngWords
//
//  Created by Alexandr Fadeev on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation
import UIKit

class WordsDataSource: NSObject {
    var tableView: UITableView
    var words: [Word]? {
        didSet {
            tableView.reloadData()
        }
    }
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    func configure() {
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        tableView.showsVerticalScrollIndicator = false
        tableView.register(WordTableViewCell.nib, forCellReuseIdentifier: WordTableViewCell.identifier)
    }
}

extension WordsDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataSource = words else {
            return 0
        }
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataSource = words else {
            return UITableViewCell()
        }
        let word = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: WordTableViewCell.identifier,
            for: indexPath
        )
        guard let wordCell = cell as? WordTableViewCell else {
            return UITableViewCell()
        }
        wordCell.configure(word: word)

        return wordCell
    }
}
