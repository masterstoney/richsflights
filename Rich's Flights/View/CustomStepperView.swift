//
//  CustomStepperView.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 13/12/2018.
//  Copyright © 2018 Tendaishe Gwini. All rights reserved.
//

import UIKit

class CustomStepperView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Properties
    
    private var subtractButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.layer.cornerRadius = 13
        button.layer.masksToBounds = true
        button.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        button.layer.borderWidth = 1.0
        button.addTarget(self, action: #selector(decreaseNumber), for: .touchUpInside)
        return button
    }()
    
    
    private var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.layer.cornerRadius = 13
        button.layer.masksToBounds = true
        button.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        button.layer.borderWidth = 1.0
        button.addTarget(self, action: #selector(incrementNumber), for: .touchUpInside)
        return button
    }()
    
    private var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    var number: Int = 0

    
    //MARK: Methods
    
    private func setupView() {
        
        addSubview(addButton)
        addSubview(subtractButton)
        addSubview(numberLabel)
        
        
        
        subtractButton.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
        subtractButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3).isActive = true
        subtractButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        subtractButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
        subtractButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
        
        
        numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        numberLabel.leadingAnchor.constraint(equalTo: subtractButton.trailingAnchor, constant: 5).isActive = true
        numberLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        addButton.centerYAnchor.constraint(equalTo: subtractButton.centerYAnchor).isActive = true
        addButton.heightAnchor.constraint(equalTo: subtractButton.heightAnchor).isActive = true
        addButton.widthAnchor.constraint(equalTo: subtractButton.widthAnchor).isActive = true
        addButton.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 3).isActive = true
        addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 3).isActive = true
        
    }
    
    
    func setStepperNumber(number: Int) {
        
        self.number = number
        numberLabel.text = "\(number)"
        
    }
    
    //MARK: Button Methods
    
    
    
    @objc func incrementNumber() {
        
        number = number + 1
        setStepperNumber(number: number)
        
    }
    
    @objc func decreaseNumber() {
        
        number = number - 1
        if number < 0 {
            number = 0
        }
        setStepperNumber(number: number)
        
    }
    
    
}
