//
//  PassengerNumberViewController.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 13/12/2018.
//  Copyright © 2018 Tendaishe Gwini. All rights reserved.
//

import UIKit

class PassengerNumberViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .clear
        setupView()
        
    }
    

    //MARK : Properties
    
    private var backgroundBlurView: UIVisualEffectView = {
        let visualEffect = UIBlurEffect(style: .light)
        let visualEffectView = UIVisualEffectView(effect: visualEffect)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        return visualEffectView
    }()
    
    
    private var numberOfPassengersView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private var numberOfPassengersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Number of travellers"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    private var adultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adults"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    private var childrenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Children"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    private var adultStepperView: CustomStepperView = {
        let customStepper = CustomStepperView()
        customStepper.translatesAutoresizingMaskIntoConstraints = false
        customStepper.setStepperNumber(number: 1)
        return customStepper
    }()
    
    
    private var childrenStepperView: CustomStepperView = {
        let customStepper = CustomStepperView()
        customStepper.translatesAutoresizingMaskIntoConstraints = false
        customStepper.setStepperNumber(number: 0)
        return customStepper
    }()
    
    
    private var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        return button
    }()
    
    var parentVC: ViewController!
    
    
    //MARK: Methods
    
    
    private func setupView() {
        
        view.addSubview(backgroundBlurView)
        view.addSubview(numberOfPassengersView)
        numberOfPassengersView.addSubview(numberOfPassengersLabel)
        numberOfPassengersView.addSubview(adultLabel)
        numberOfPassengersView.addSubview(adultStepperView)
        numberOfPassengersView.addSubview(childrenLabel)
        numberOfPassengersView.addSubview(childrenStepperView)
        numberOfPassengersView.addSubview(doneButton)
        
        
        
        backgroundBlurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundBlurView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundBlurView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundBlurView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        numberOfPassengersView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        numberOfPassengersView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numberOfPassengersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        numberOfPassengersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        
        numberOfPassengersLabel.topAnchor.constraint(equalTo: numberOfPassengersView.topAnchor).isActive = true
        numberOfPassengersLabel.leadingAnchor.constraint(equalTo: numberOfPassengersView.leadingAnchor).isActive = true
        numberOfPassengersLabel.trailingAnchor.constraint(equalTo: numberOfPassengersView.trailingAnchor).isActive = true
        numberOfPassengersLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        adultLabel.topAnchor.constraint(equalTo: numberOfPassengersLabel.bottomAnchor, constant: 15).isActive = true
        adultLabel.leadingAnchor.constraint(equalTo: numberOfPassengersView.leadingAnchor, constant: 15).isActive = true
        adultLabel.widthAnchor.constraint(equalTo: numberOfPassengersView.widthAnchor, multiplier: 0.72).isActive = true
        adultLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        adultStepperView.centerYAnchor.constraint(equalTo: adultLabel.centerYAnchor).isActive = true
        adultStepperView.leadingAnchor.constraint(equalTo: adultLabel.trailingAnchor).isActive = true
        adultStepperView.trailingAnchor.constraint(equalTo: numberOfPassengersView.trailingAnchor, constant: -5).isActive = true
        adultStepperView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        childrenLabel.topAnchor.constraint(equalTo: adultLabel.bottomAnchor, constant: 10).isActive = true
        childrenLabel.leadingAnchor.constraint(equalTo: adultLabel.leadingAnchor).isActive = true
        childrenLabel.widthAnchor.constraint(equalTo: adultLabel.widthAnchor).isActive = true
        childrenLabel.heightAnchor.constraint(equalTo: adultLabel.heightAnchor).isActive = true
        
        
        childrenStepperView.centerYAnchor.constraint(equalTo: childrenLabel.centerYAnchor).isActive = true
        childrenStepperView.leadingAnchor.constraint(equalTo: adultStepperView.leadingAnchor).isActive = true
        childrenStepperView.trailingAnchor.constraint(equalTo: adultStepperView.trailingAnchor).isActive = true
        childrenStepperView.heightAnchor.constraint(equalTo: adultStepperView.heightAnchor).isActive = true
        
        
        doneButton.topAnchor.constraint(equalTo: childrenLabel.bottomAnchor, constant: 12).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: numberOfPassengersView.leadingAnchor).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: numberOfPassengersView.trailingAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: numberOfPassengersView.bottomAnchor).isActive = true
        
        
    }
    
    
    
    
    
    @objc func dismissVC() {
        
        parentVC.userTrip.passengers = adultStepperView.number + childrenStepperView.number
        self.dismiss(animated: false, completion: nil)
    
        
    }
    
    
    

}
