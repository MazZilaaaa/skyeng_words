//
//  SearchMeaningsViewController.swift
//  SkyEngWords
//
//  Created by Alexandr Fadeev on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

final class SearchMeaningsViewController: UIViewController, ModuleTransitionable {
    var output: SearchMeaningsViewOutput?
    var dataSource: WordsDataSource?
    var searchController: UISearchController?

    @IBOutlet weak private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true

        searchController = UISearchController(searchResultsController: nil)
        searchController?.obscuresBackgroundDuringPresentation = false
        searchController?.searchBar.placeholder = "введите слово"
        searchController?.searchResultsUpdater = self
        navigationItem.searchController = searchController

        dataSource = WordsDataSource(output: self)
        dataSource?.configure(tableView: tableView)
        output?.viewLoaded()
    }

    func didSelectWord(word: Word) {
        output?.didSelectWord(word: word)
    }

    func endReached() {
        output?.loadMoreSearchResults()
    }
}

extension SearchMeaningsViewController: SearchMeaningsViewInput {
    func setTitle(title: String?) {
        self.title = title
    }

    func setWords(words: [Word]) {
        dataSource?.items = words
    }

    func setState(state: LoadingState) {
        switch state {
        case .loading:
            dataSource?.isLoading = true
        case .success, .failed:
            dataSource?.isLoading = false
        }
    }
}

extension SearchMeaningsViewController: WordsViewAdapterOutput {
    func willBeginDragging() {
        searchController?.searchBar.resignFirstResponder()
    }
}

extension SearchMeaningsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            output?.searchTextChanged(word: text)
        }
    }
}
