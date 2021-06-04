//
//  ItineraryViewController.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 25/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class ItineraryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    

    //MARK: Properties
    
    private var itinerarySummaryView: ItinerarySummaryView = {
        let view = ItinerarySummaryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var itinerary: SkypickerTrip? {
        didSet {
            if let itinerary = itinerary {
                itinerarySummaryView.populateView(data: itinerary)
            }
        }
    }
    
    
    //MARK: Methods
    
    private func setupView() {
        
        
        view.addSubview(itinerarySummaryView)
        itinerarySummaryView.constrainToSuper()
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
