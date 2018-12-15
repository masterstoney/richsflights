//
//  TabViewController.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 12/12/2018.
//  Copyright © 2018 Tendaishe Gwini. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let homeViewController = ViewController()
        let tripsViewController = TripsViewController()
        
        
        viewControllers = [populateVCs("Search", "searchIcon.png", homeViewController), populateVCs("Trips", "airplane.png", tripsViewController)]
        
        
        
        
        
        
    }
    
    
    
    
    
    func populateVCs(_ title: String, _ image: String, _ vcType: UIViewController) -> UINavigationController {
        let viewController = vcType==UIViewController() ? UIViewController() : vcType
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: image)
        return navController
    }

}
