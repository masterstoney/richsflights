//
//  SkypickerSearchManager.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 18/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class SkypickerSearchManager {
    
    
    func search(trip: Trip, completion: @escaping (_ results: SkypickerDataModel, _ error: Error?) -> Void) {
        
        let urlString = "https://api.skypicker.com/flights?fly_from=" + trip.source + "&fly_to=" + trip.destination + "&date_from=" + trip.departureDate + "&date_to=" + trip.departureDate + "&return_from=" + trip.returnDate + "&return_to=" + trip.returnDate + "&adults=1"
        var skypickerData = SkypickerDataModel()
        let url = URL(string: urlString)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                completion(skypickerData,error)
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(SkypickerDataModel.self, from: data)
                    skypickerData = result
                } catch {
                    print(error)
                }
                completion(skypickerData,error)
            }
        }
        task.resume()
        
    }
    
    
    
    
    
    
}

