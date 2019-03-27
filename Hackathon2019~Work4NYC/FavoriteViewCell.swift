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
        locationLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
        locationLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        locationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        locationLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    private func setupSalaryLabel() {
        addSubview(salaryLabel)
        salaryLabel.translatesAutoresizingMaskIntoConstraints = false
        salaryLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.90).isActive = true
        salaryLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        salaryLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        salaryLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
