//
//  CityView.swift
//  FoldingCellExperiment
//
//  Created by Tendaishe Gwini on 24/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class CityView: UIView {

    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: Properties
    
    private var cityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "New York City"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    private var cityCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "JFK"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "18:30"
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    
    //MARK: Methods
    
    
    private func setupView() {
        
        addSubview(cityNameLabel)
        addSubview(cityCodeLabel)
        addSubview(timeLabel)
        
        
        cityNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        cityNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        cityNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        cityNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        cityNameLabel.bottomAnchor.constraint(equalTo: cityCodeLabel.topAnchor, constant: -5).isActive = true
        
        cityCodeLabel.leadingAnchor.constraint(equalTo: cityNameLabel.leadingAnchor).isActive = true
        cityCodeLabel.trailingAnchor.constraint(equalTo: cityNameLabel.trailingAnchor).isActive = true
        cityCodeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cityCodeLabel.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -5).isActive = true
        
        timeLabel.leadingAnchor.constraint(equalTo: cityCodeLabel.leadingAnchor).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: cityCodeLabel.trailingAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        
    }
    
    
    func populateView(cityName: String, cityCode: String, time: Int) {
        cityNameLabel.text = cityName
        cityCodeLabel.text = cityCode
        let date = Date(timeIntervalSince1970: Double(time))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        timeLabel.text = dateFormatter.string(from: date)
    }
    
    
}
