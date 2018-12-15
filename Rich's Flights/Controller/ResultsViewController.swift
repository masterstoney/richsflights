//
//  ResultsViewController.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 13/12/2018.
//  Copyright © 2018 Tendaishe Gwini. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = displayTitle
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupView()
      //  loadingView.loopAnimation = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    //MARK: Properties
    
    var displayTitle: String!
    
    var userTrip: Trip!
//
//    private var loadingView: LOTAnimationView = {
//        let animationView = LOTAnimationView()
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        animationView.setAnimation(named: "airplane")
//        animationView.loopAnimation = true
//        return animationView
//    }()
    
    private var infoText: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedText = NSAttributedString(string: "Please be patient as we look for the best flights for you", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
        textField.isSelectable = false
        textField.isEditable = false
        return textField
    }()
    
    //MARK: Methods
    
    
    
    private func setupView() {
        
        
  //      view.addSubview(loadingView)
        view.addSubview(infoText)
//
//        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        loadingView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
//        loadingView.heightAnchor.constraint(equalTo: loadingView.widthAnchor).isActive = true
        
        
//        infoText.topAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: 10).isActive = true
//        infoText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
//        infoText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
//        
        
        
    }
    
    
    
    

}
