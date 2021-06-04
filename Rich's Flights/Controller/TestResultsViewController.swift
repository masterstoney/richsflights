//
//  TestResultsViewController.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 18/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class TestResultsViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    //MARK: Properties
    
    private lazy var resultsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: myLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView.register(TestResultCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        return collectionView
    }()
    
    var flightsData: [SkypickerTrip] = []
    
    
    //MARK: Methods
    
    private func setupView() {
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(resultsCollectionView)
        resultsCollectionView.constrainToSuper()
        
    }
    
    private func myLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: view.frame.width - 30, height: 1.0)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        return layout
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 30, height: 1.0)
    }
    
    //MARK: CollectionView Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flightsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! TestResultCollectionViewCell
        cell.populateCell(trip: flightsData[indexPath.item])
        return cell
    }
    
    
    

}
