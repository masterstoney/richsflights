//
//  AirportTableViewCell.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 13/12/2018.
//  Copyright © 2018 Tendaishe Gwini. All rights reserved.
//

import UIKit

class AirportTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    //MARK: Properties
    
    private var airportNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var airportCityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "locationIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    
    //MARK: Methods
    
    
    private func setupView() {
        
        addSubview(iconImageView)
        addSubview(airportNameLabel)
        addSubview(airportCityNameLabel)
        
        
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        airportNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        airportNameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10).isActive = true
        airportNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        airportNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true

        
        
        airportCityNameLabel.topAnchor.constraint(equalTo: airportNameLabel.bottomAnchor, constant: 2).isActive = true
        airportCityNameLabel.leadingAnchor.constraint(equalTo: airportNameLabel.leadingAnchor).isActive = true
        airportCityNameLabel.trailingAnchor.constraint(equalTo: airportNameLabel.trailingAnchor).isActive = true
        airportCityNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        airportCityNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
    }
    
    func populateCell(airport: Airport) {
        
        airportNameLabel.attributedText = NSAttributedString(string: "\(airport.airportCode) - \(airport.airportName)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 19), NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)])
        airportCityNameLabel.attributedText = NSAttributedString(string: "\(airport.cityName), \(airport.countryName)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)])
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}
