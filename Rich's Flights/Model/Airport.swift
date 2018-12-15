//
//  Airport.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 13/12/2018.
//  Copyright © 2018 Tendaishe Gwini. All rights reserved.
//

import UIKit

class Airport: Equatable {
    
    //MARK: Propeties
    
    let airportCode: String
    let airportName: String
    let cityCode: String
    let cityName: String
    let countryName: String
    let countryCode: String
    let lat: String
    let lon: String
    
    init(airportCode: String, airportName: String, cityCode: String, cityName: String, countryName: String, countryCode: String, lat: String, lon: String) {
        
        self.airportCode = airportCode
        self.airportName = airportName
        self.cityCode = cityCode
        self.cityName = cityName
        self.countryName = countryName
        self.countryCode = countryCode
        self.lat = lat
        self.lon = lon
        
    }
    
    //MARK: Equatable Method Stubs
    
    static func == (lhs: Airport, rhs: Airport) -> Bool {
        return lhs.airportCode == rhs.airportCode
    }
    
    
    
    
}
