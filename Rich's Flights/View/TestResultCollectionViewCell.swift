//
//  TestResultCollectionViewCell.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 18/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class TestResultCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Properties
    
    private var itineraryViewController: ItineraryViewController = {
        let vc = ItineraryViewController()
    //    vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    
    //MARK: Methods
    
    
    private func setupView() {
        
        
        heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        itineraryViewController.view.frame = bounds
        addSubview(itineraryViewController.view)
     //   itineraryViewController.view.constrainToSuper()
        
    }
    
    func populateCell(trip: SkypickerTrip) {
        itineraryViewController.itinerary = trip
    }
    
    
    
    
    
    
    
}
