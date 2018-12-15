//
//  AirportSearchViewController.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 13/12/2018.
//  Copyright © 2018 Tendaishe Gwini. All rights reserved.
//

import UIKit

class AirportSearchViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Select Airport"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissVC))
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        airportsData.fetchData()
        setupViews()
    }

    
    //MARK: Properties
    
    var parentVC: AirportSelectionViewController!
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Enter city or airport name"
        return searchController
    }()
    
    private var searchInfoTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.isEditable = false
        let text = NSAttributedString(string: "You may make your search by using the city name, city code, airport code, airport name.\nFor example \"New York City\", \"NYC\", \"JFK\", \"John F Kennedy Intl\" all refer to the airport in New York City.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
        textView.attributedText = text
        textView.textAlignment = .center
        return textView
    }()
    
    private lazy var airportsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AirportTableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50.0
        tableView.isHidden = true
        return tableView
    }()
    
    private var airportsData = AirportsData()
    
    private var searchResults: [Airport] = []
    
    
    
    //MARK: Methods


    private func setupViews() {
        
        view.addSubview(searchInfoTextView)
        view.addSubview(airportsTableView)
        
        searchInfoTextView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        searchInfoTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchInfoTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        searchInfoTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        
        airportsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        airportsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        airportsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        airportsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        
        
        
        
    }
    
    
    
    
    @objc func dismissVC() {
        
        parentVC.dismissVC(airport: nil)
        
    }
    
    
    //MARK: Table View Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! AirportTableViewCell
        cell.populateCell(airport: searchResults[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        parentVC.dismissVC(airport: searchResults[indexPath.row])
    }
    
    //MARK: Search Results Methods
    
    func updateSearchResults(for searchController: UISearchController) {
        searchInfoTextView.isHidden = true
        airportsTableView.isHidden = false
        
        
        
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            searchResults = airportsData.data.filter({ (airport) -> Bool in
                airport.airportCode.lowercased().contains(searchText.lowercased())
            })
            searchResults += airportsData.data.filter({ (airport) -> Bool in
                airport.airportName.lowercased().contains(searchText.lowercased())
            })
            searchResults += airportsData.data.filter({ (airport) -> Bool in
                airport.cityName.lowercased().contains(searchText.lowercased())
            })
            searchResults += airportsData.data.filter({ (airport) -> Bool in
                airport.cityCode.lowercased().contains(searchText.lowercased())
            })
            searchResults.removeDuplicates()
        } else {
            searchResults = []
        }
        airportsTableView.reloadData()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
