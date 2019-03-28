//
//  FavoriteViewCell.swift
//  Hackathon2019~Work4NYC
//
//  Created by Alfredo Barragan on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation
import UIKit

class FavoriteViewCell: UITableViewCell {
    var titleLabel : UILabel = {
       var titleLabel = UILabel()
       titleLabel.translatesAutoresizingMaskIntoConstraints = false
       return titleLabel
    }()
    var locationLabel : UILabel = {
        var locationLabel = UILabel()
        return locationLabel
    }()
    var salaryLabel : UILabel = {
        var salaryLabel = UILabel()
        return salaryLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        }
    required init?(coder aDecoder: NSCoder) {
        fatalError("error")
        commonInit()
    }
    private func commonInit() {
        setupLocationLabel()
        setupSalaryLabel()
        setupTitleLabel()
    }
    private func setupLocationLabel() {
        addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
//        locationLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
//        locationLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        locationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)
        locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)
        locationLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
    private func setupSalaryLabel() {
        addSubview(salaryLabel)
        salaryLabel.translatesAutoresizingMaskIntoConstraints = false
//        salaryLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.90).isActive = true
//        salaryLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        salaryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        salaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)
        salaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -200)
        salaryLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
//        titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150)
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
}
