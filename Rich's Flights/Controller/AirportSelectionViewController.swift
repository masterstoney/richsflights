//
//  AirportSelectionViewController.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 13/12/2018.
//  Copyright © 2018 Tendaishe Gwini. All rights reserved.
//

import UIKit

class AirportSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .clear
        setupView()
    }
    

    //MARK: Properties
    
    var tabBarDelegate: TabBarDelegate!
    
    var airportSelectDelegate: AirportSelectDelegate!
    
    private var backgroundBlurView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
   //     view.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        return view
    }()
    

    
    private lazy var airportSearchNavController: UINavigationController = {
        let airportSearch = AirportSearchViewController()
        let navigationController = UINavigationController(rootViewController: airportSearch)
        navigationController.view.translatesAutoresizingMaskIntoConstraints = false
        navigationController.didMove(toParent: self)
        airportSearch.parentVC = self
        return navigationController
    }()
    
    //MARK: Methods
    
    private func setupView() {
        
        view.addSubview(backgroundBlurView)
        view.addSubview(contentView)
        contentView.addSubview(airportSearchNavController.view)

        
        
        backgroundBlurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundBlurView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundBlurView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundBlurView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        

        
        airportSearchNavController.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        airportSearchNavController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        airportSearchNavController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        airportSearchNavController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        
    }
    
    
    func blurAnimation() {
        
        UIView.animate(withDuration: 1.0) {
            self.backgroundBlurView.isHidden = false
        }
        
    }
    
    //MARK: Navigation
    
    func dismissVC(airport: Airport?) {
        backgroundBlurView.isHidden = true
        tabBarDelegate.tabBarVisibility(visible: false)
        airportSelectDelegate.airportSelected(airport: airport)
        self.dismiss(animated: true, completion: nil)
    }
    

}
