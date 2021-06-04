//
//  ItineraryDetailView.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 25/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class ItineraryDetailView: UIView {

    //MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    
    //MARK: Properties
    
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.textAlignment = .center
        return label
    }()
    
    private var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Detail"
        return label
    }()
    
    
    //MARK: Methods
    
    
    private func setupView() {
        
        addSubview(titleLabel)
        addSubview(detailLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
    }
    
    
    func populateDetailView (title: String, detail: String) {
       
        titleLabel.attributedText = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)])
        detailLabel.attributedText = NSAttributedString(string: detail, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)])
        
    }
    
    
    
}
