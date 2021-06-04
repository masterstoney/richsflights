//
//  ItinerarySummaryView.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 25/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class ItinerarySummaryView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Properties
    
    private var routeView: RouteView = {
        let view = RouteView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private var airlineLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "B6")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private var airlineName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "jetBlue"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    private var durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private var stopsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    
    private var priceDetailView = ItineraryDetailView()
    private var durationDetailView = ItineraryDetailView()
    private var stopsDetailView = ItineraryDetailView()
    
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    //MARK: Methods
    
    
    private func setupView() {
        
        
        addSubview(routeView)
        addSubview(airlineLogoImageView)
        addSubview(airlineName)
        addSubview(stackView)
        stackView.addArrangedSubview(priceDetailView)
        stackView.addArrangedSubview(durationDetailView)
        stackView.addArrangedSubview(stopsDetailView)
        
        
        airlineLogoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        airlineLogoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        airlineLogoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        airlineLogoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        routeView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        routeView.leadingAnchor.constraint(equalTo: airlineLogoImageView.trailingAnchor, constant: 10).isActive = true
        routeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        routeView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        airlineName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        airlineName.trailingAnchor.constraint(equalTo: routeView.leadingAnchor, constant: -5).isActive = true
        airlineName.topAnchor.constraint(equalTo: airlineLogoImageView.bottomAnchor, constant: 10).isActive = true
        airlineName.bottomAnchor.constraint(equalTo: routeView.bottomAnchor).isActive = true
        
        
        stackView.leadingAnchor.constraint(equalTo: routeView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: routeView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: routeView.bottomAnchor, constant: 10).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
    }
    
    
    func populateView(data: SkypickerTrip) {
        
        routeView.populateRoute(data: data.route[0])
        airlineName.text = data.airlines[0]
        priceDetailView.populateDetailView(title: "Price", detail: "\(data.price)")
        durationDetailView.populateDetailView(title: "Duration", detail: data.fly_duration)
        stopsDetailView.populateDetailView(title: "Stops", detail: "\(data.route.count)")
        
    }
    
    
    
    
    
}
