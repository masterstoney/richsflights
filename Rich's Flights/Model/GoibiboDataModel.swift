//
//  GoibiboDataModel.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 03/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class GoibiboDataModel: Codable {
    
    var data = GoibiboData()
    
}


class GoibiboData: Codable {
    
    var onwardflights: [GoibiboFlight] = []
    
}

class GoibiboFlight: Codable {
    
    var origin = String()
    var flightcode = String()
    var depterminal = String()
    var deptime = String()
    var duration = String()
    var arrterminal = String()
    var flightno = String()
    var destination = String()
    var stops = String()
    var seatsavailable = String()
    var carrierid = String()
    var airline = String()
    var fare = GoibiboFare()
    var onwardflights: [GoibiboFlight]?
    var aircraftType = String()
    var seatingclass: String?
    var operatingcarrier = String()
    var splitduration: String?
    var depdate = String()
    var arrtime = String()
    var arrdate = String()
    var returnfl: [GoibiboFlight]?
    
}

class GoibiboFare: Codable {
    
    var grossamount: Int?
    var totalbasefare: Int?
    
}
