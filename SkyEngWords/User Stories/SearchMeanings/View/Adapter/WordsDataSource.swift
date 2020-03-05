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
    var tableView: UITableView?
    var items: [Word] {
        didSet {
            tableView?.reloadData()
        }
    }

    private let output: WordsViewAdapterOutput

    init(output: WordsViewAdapterOutput) {
        self.output = output
        self.items = [Word]()
    }

    func configure(tableView: UITableView) {
        self.tableView = tableView
        tableView.dataSource = self
        tableView.delegate = self
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
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let word = items[indexPath.row]
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

extension WordsDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectWord(word: items[indexPath.row])
    }
}
