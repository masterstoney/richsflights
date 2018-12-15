//
//  AirportsData.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 13/12/2018.
//  Copyright © 2018 Tendaishe Gwini. All rights reserved.
//

import UIKit

class AirportsData {
    
    //MARK: Properties
    
    var data: [Airport] = []
    private var airportsDatabase = AirportsDatabaseManager()
    
    
    //MARK: Methods
    
    func fetchData() {
        airportsDatabase.connectDB()
        data = airportsDatabase.getAirportList()
    }
    
}
