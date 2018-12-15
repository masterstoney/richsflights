//
//  BookingTableViewCell.swift
//  Rich's Flights
//
//  Created by Tendaishe Gwini on 12/12/2018.
//  Copyright © 2018 Tendaishe Gwini. All rights reserved.
//

import UIKit

class BookingTableViewCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    //MARK: Properties
    
    
    private let backdropView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 5
        return view
    }()
    
    
    private let instructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        return label
    }()
    
    
    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: Methods
    
    private func setupView() {
        
        
        addSubview(backdropView)
        addSubview(instructionLabel)
        addSubview(iconView)
        
        
        backdropView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        backdropView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        backdropView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        backdropView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        iconView.centerYAnchor.constraint(equalTo: backdropView.centerYAnchor).isActive = true
        iconView.leadingAnchor.constraint(equalTo: backdropView.leadingAnchor, constant: 8).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        instructionLabel.centerYAnchor.constraint(equalTo: backdropView.centerYAnchor).isActive = true
        instructionLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10).isActive = true
        instructionLabel.trailingAnchor.constraint(equalTo: backdropView.trailingAnchor, constant: -8).isActive = true
        instructionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func populateCell(bookingCellItem: BookingCellItemModel) {
        
        iconView.image = bookingCellItem.icon
        instructionLabel.text = bookingCellItem.instruction
        
    }
    
    
    
    
    
    

}
