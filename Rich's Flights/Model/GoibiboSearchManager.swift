//
//  GoibiboSearchManager.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 03/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class GoibiboSearchManager {
    
    
    func search(trip: Trip, completion: @escaping (_ results: GoibiboData, _ error: Error?) -> Void) {
        
        let urlString = "https://developer.goibibo.com/api/search/?app_id=5cb1464f&app_key=62c39029935e62945f0d999ea4fe0cd5&format=json&source=" + trip.source + "&destination=" + trip.destination + "&dateofdeparture=" + trip.departureDate + "&seatingclass=E&adults=1&children=0&infants=0&counter=0"
        var goibiboData = GoibiboData()
        let url = URL(string: urlString)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                completion(goibiboData,error)
         //       print(error?.localizedDescription)
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(GoibiboDataModel.self, from: data)
                    goibiboData = result.data
                } catch {
                    print(error)
                }
                DispatchQueue.main.async {
                    completion(goibiboData,nil)
                }
            }
            
        }
        task.resume()
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
