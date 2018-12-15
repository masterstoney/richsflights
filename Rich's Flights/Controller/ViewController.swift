//
//  ViewController.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 11/12/2018.
//  Copyright © 2018 Tendaishe Gwini. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TabBarDelegate, AirportSelectDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.navigationBar.isHidden = true
        setupView()
    }

    
    //MARK: Properties
    
    private var options: [BookingCellItemModel] = [
    BookingCellItemModel(icon: #imageLiteral(resourceName: "takeoff"), instruction: "Flying From"),
    BookingCellItemModel(icon: #imageLiteral(resourceName: "landing"), instruction: "Flying To"),
    BookingCellItemModel(icon: #imageLiteral(resourceName: "calendar"), instruction: "Select Dates"),
    BookingCellItemModel(icon: #imageLiteral(resourceName: "person"), instruction: "Number of Passengers")
    ]
    
    private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "planeBeach")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var bookingTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BookingTableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = 70
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 10
        return tableView
    }()
    
    private var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Find Flights", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(searchForFlights), for: .touchUpInside)
        return button
    }()
    
    private var selectedOption: Int?
    
    var userTrip = Trip()
    
    //MARK: Setup
    
    private func setupView() {
       
        view.addSubview(backgroundImageView)
        view.addSubview(bookingTableView)
        view.addSubview(doneButton)
        
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        bookingTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bookingTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        bookingTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        bookingTableView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        
        doneButton.topAnchor.constraint(equalTo: bookingTableView.bottomAnchor, constant: -7).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: bookingTableView.leadingAnchor).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: bookingTableView.trailingAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    
    
    //MARK: Table View Methods
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookingTableViewCell
        cell.populateCell(bookingCellItem: options[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 3 {
            let presentedController = PassengerNumberViewController()
            presentedController.modalPresentationStyle = .overCurrentContext
            presentedController.parentVC = self
            self.present(presentedController, animated: false, completion: nil)
        } else if indexPath.row == 2 {
            let presentedController = SelectDatesViewController()
            presentedController.modalPresentationStyle = .overCurrentContext
            presentedController.parentVC = self
            self.present(presentedController, animated: false, completion: nil)
        } else {
            
            selectedOption = indexPath.row
            tabBarController?.tabBar.isHidden = true
            let presentedController = AirportSelectionViewController()
            presentedController.tabBarDelegate = self
            presentedController.airportSelectDelegate = self
            presentedController.modalPresentationStyle = .overCurrentContext
            self.present(presentedController, animated: true) {
                presentedController.blurAnimation()
            }
            
        }
        

    }

    
    @objc func searchForFlights() {
        
        
        let presentedController = ResultsViewController()
        presentedController.userTrip = userTrip
        presentedController.displayTitle = "\(userTrip.source) - \(userTrip.destination)"
        self.navigationController?.pushViewController(presentedController, animated: true)
        
        
        
        
    }
    
    
    //MARK: Tab Bar Delegate Method
    
    func tabBarVisibility(visible: Bool) {
        
        self.tabBarController?.tabBar.isHidden = visible
    
    }
    
    
    //MARK: Airport Select Delegate Method
    
    func airportSelected(airport: Airport?) {
        
        if let airport = airport {
            options[selectedOption!].instruction = "\(airport.airportCode) - \(airport.airportName)"
            if selectedOption == 0 {
                userTrip.source = airport.airportCode
            } else {
                userTrip.destination = airport.airportCode
            }
            bookingTableView.reloadData()
        }
        
        
    }
    
    
    
}

