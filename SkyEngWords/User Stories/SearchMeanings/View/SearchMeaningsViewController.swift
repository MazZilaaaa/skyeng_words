//
//  SearchMeaningsViewController.swift
//  SkyEngWords
//
//  Created by Alexandr Fadeev on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

final class SearchMeaningsViewController: UIViewController, SearchMeaningsViewInput, ModuleTransitionable, UISearchBarDelegate {
    var output: SearchMeaningsViewOutput?
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    func setState(state: LoadingState) {
    }
    func setWords(words: [Word]) {
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(search), object: nil)
        self.perform(#selector(search), with: nil, afterDelay: 0.5)
    }
    @objc private func search() {
        output?.search(word: searchBar.text!)
    }
}
