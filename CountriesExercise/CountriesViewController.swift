//
//  ViewController.swift
//  CountriesExercise
//
//  Created by Marcell Fulop on 7/1/25.
//

import NetworkLayer
import UIKit

class CountriesViewController: UIViewController {
    private var countries: [Country] = []
    private var filteredCountries: [Country] = []
    private let tableView = UITableView()
    private let serviceManager = ServiceManager()
    private let searchController = UISearchController(
        searchResultsController: nil
    )
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self

        tableView.register(
            CountryCell.self,
            forCellReuseIdentifier: "CountryCell"
        )
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search countries"
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        Task {
            do {
                countries = try await serviceManager.execute(
                    request: CountriesRequest.createRequest(),
                    modelName: [Country].self
                )
                filteredCountries = countries
                tableView.reloadData()
            } catch {
                print("\(error)")
            }
        }

    }
}

extension CountriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
        return filteredCountries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "CountryCell"
            ) as? CountryCell
        else {
            return UITableViewCell()
        }
        let country = filteredCountries[indexPath.row]
        cell.configure(
            name: country.name,
            region: country.region,
            code: country.code,
            capital: country.capital
        )
        return cell
    }
}

extension CountriesViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            filteredCountries = countries
            return
        }
        if searchText.isEmpty {
            filteredCountries = countries
            return
        }
        filteredCountries = countries.filter {
            $0.name.lowercased().contains(searchText.lowercased())
                || $0.capital.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredCountries = countries
        tableView.reloadData()
        searchBar.resignFirstResponder() 
    }
}
