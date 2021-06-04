//
//  UIViewExtension.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 18/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

extension UIView {
    
    func constrainToSuper() {
        
        if let superview = superview {
            self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
        
    }
    
}
