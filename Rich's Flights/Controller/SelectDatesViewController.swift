//
//  SelectDatesViewController.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 13/12/2018.
//  Copyright © 2018 Tendaishe Gwini. All rights reserved.
//

import UIKit

class SelectDatesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .clear
        setupViews()
    }
    
    //MARK: Properties
    
    
    private var backgroundBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        return visualEffectView
    }()
    
    
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    
    private var departureDateTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Date of Departure"
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date()
        datePicker.addTarget(self, action: #selector(departureDateChanged(datePicker:)), for: .valueChanged)
        textField.inputView = datePicker
        return textField
    }()
    
    private var returnTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Date of Return"
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date()
        datePicker.addTarget(self, action: #selector(returnDateChanged(datePicker:)), for: .valueChanged)
        textField.inputView = datePicker
        return textField
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
    
    
    private func setupViews() {
        
        view.addSubview(backgroundBlurView)
        view.addSubview(contentView)
        contentView.addSubview(departureDateTextField)
        contentView.addSubview(returnTextField)
        contentView.addSubview(doneButton)
        
        
        backgroundBlurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundBlurView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundBlurView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundBlurView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        
        departureDateTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        departureDateTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        departureDateTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        departureDateTextField.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        returnTextField.topAnchor.constraint(equalTo: departureDateTextField.bottomAnchor, constant: 10).isActive = true
        returnTextField.leadingAnchor.constraint(equalTo: departureDateTextField.leadingAnchor).isActive = true
        returnTextField.trailingAnchor.constraint(equalTo: departureDateTextField.trailingAnchor).isActive = true
        returnTextField.heightAnchor.constraint(equalTo: departureDateTextField.heightAnchor).isActive = true
        
        
        
        doneButton.topAnchor.constraint(equalTo: returnTextField.bottomAnchor, constant: 15).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        
    }
    
    
    
    
    @objc func departureDateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        departureDateTextField.text = dateFormatter.string(from: datePicker.date)
        
        
    }
    
    @objc func returnDateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        returnTextField.text = dateFormatter.string(from: datePicker.date)
        
    }
    
    @objc func dismissVC() {
        
        parentVC.userTrip.departureDate = departureDateTextField.text!
        parentVC.userTrip.returnDate = returnTextField.text!
        self.dismiss(animated: false, completion: nil)
        
        
    }

}
