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

    var isLoading = false {
        didSet {
            tableView?.reloadData()
        }
    }
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
        tableView.register(LoadingCell.nib, forCellReuseIdentifier: LoadingCell.identifier)
        tableView.tableFooterView = UIView()
    }
}

extension WordsDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return isLoading ? 2 : 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 1
        }
        return  items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: LoadingCell.identifier,
                for: indexPath)

            if let LoadingCell = cell as? LoadingCell {
                LoadingCell.configure()
            }

            return cell
        }

        let word = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: WordTableViewCell.identifier,
            for: indexPath)

        guard let wordCell = cell as? WordTableViewCell else {
            return UITableViewCell()
        }

        wordCell.configure(word: word)

        return wordCell
    }
}

extension WordsDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output.didSelectWord(word: items[indexPath.row])
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        output.willBeginDragging()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.isDragging else {
            return
        }

        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height * 2 {
            output.endReached()
        }
    }
}
