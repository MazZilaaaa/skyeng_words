//
//  MeaningsDataSource.swift
//  SkyEngWords
//
//  Created by Alexandr on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation
import UIKit

final class MeaningsDataSource: NSObject {
    var tableView: UITableView?
    
    var word: Word?
    
    var items: [Meaning] {
        didSet {
            tableView?.reloadData()
        }
    }

    private let output: MeaningsViewAdapterOutput

    init(output: MeaningsViewAdapterOutput) {
        self.output = output
        self.items = [Meaning]()
    }

    func configure(tableView: UITableView) {
        self.tableView = tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        tableView.showsVerticalScrollIndicator = false
        tableView.register(MeaningTableViewCell.nib, forCellReuseIdentifier: MeaningTableViewCell.identifier)
        tableView.tableFooterView = UIView()
    }
}

extension MeaningsDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meaning = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MeaningTableViewCell.identifier,
            for: indexPath)

        guard let meaningCell = cell as? MeaningTableViewCell else {
            return UITableViewCell()
        }

        meaningCell.configure(with: meaning)

        return meaningCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "значения"
    }
}

extension MeaningsDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
