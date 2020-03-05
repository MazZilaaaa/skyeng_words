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
    WordsViewAdapterOutput,
UISearchBarDelegate {

    var output: SearchMeaningsViewOutput?
    var dataSource: WordsDataSource?

    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        dataSource = WordsDataSource(output: self)
        dataSource?.configure(tableView: tableView)
        output?.viewLoaded()
    }
    
    func setTitle(title: String?) {
        self.title = title
    }

    func setState(state: LoadingState) {
        switch state {
        case .loading:
            dataSource?.isLoading = true
        case .success, .failed:
            dataSource?.isLoading = false
        }
    }

    func setWords(words: [Word]) {
        dataSource?.items = words
    }
    
    func clearWords() {
        dataSource?.items = []
    }

    func didSelectWord(word: Word) {
        output?.didSelectWord(word: word)
    }

    func endReached() {
        output?.loadMoreSearchResults()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        output?.searchTextChanged(word: searchText)
    }
}
