//
//  RouteView.swift
//  FoldingCellExperiment
//
//  Created by Tendaishe Gwini on 24/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class RouteView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Properties
    
    private var departureCityView: CityView = {
        let view = CityView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var arrivalCityView: CityView = {
        let view = CityView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private var planeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "plane")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    
    //MARK: Methods
    
    
    private func setupView() {
        
        
        addSubview(departureCityView)
        addSubview(arrivalCityView)
        addSubview(planeImageView)
        
        
        departureCityView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        departureCityView.trailingAnchor.constraint(equalTo: planeImageView.leadingAnchor, constant: -15).isActive = true
        departureCityView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        
        
        arrivalCityView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        arrivalCityView.leadingAnchor.constraint(equalTo: planeImageView.trailingAnchor, constant: 15).isActive = true
        arrivalCityView.widthAnchor.constraint(equalTo: departureCityView.widthAnchor).isActive = true
        
        planeImageView.centerYAnchor.constraint(equalTo: departureCityView.centerYAnchor).isActive = true
        planeImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        planeImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        planeImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }
    
    func populateRoute(data: SkypickerRoute) {
        
        departureCityView.populateView(cityName: data.cityFrom, cityCode: data.flyFrom, time: data.dTimeUTC)
        arrivalCityView.populateView(cityName: data.cityTo, cityCode: data.flyTo, time: data.aTimeUTC)
        
    }
    
    
    
    
    
    
    
}
