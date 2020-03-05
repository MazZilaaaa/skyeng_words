//
//  SearchMeaningsViewController.swift
//  SkyEngWords
//
//  Created by Alexandr Fadeev on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

final class SearchMeaningsViewController: UIViewController,
    SearchMeaningsViewInput,
    ModuleTransitionable,
    UISearchBarDelegate {
    var output: SearchMeaningsViewOutput?
    var dataSource: WordsDataSource?
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        dataSource = WordsDataSource(tableView: tableView)
        dataSource?.configure()
    }
    func setState(state: LoadingState) {
    }
    func setWords(words: [Word]) {
        dataSource?.words = words
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text else {
            return
        }
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(search), object: nil)
        if searchText.isEmpty {
            search()
        } else {
            self.perform(#selector(search), with: nil, afterDelay: 0.5)
        }
    }
    
    @objc
    private func search() {
        if let searchText = searchBar.text {
            output?.search(word: searchText)
        }
    }
}
