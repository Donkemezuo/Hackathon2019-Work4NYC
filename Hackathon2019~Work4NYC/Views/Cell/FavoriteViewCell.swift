//
//  FavoriteViewCell.swift
//  Hackathon2019~Work4NYC
//
//  Created by Alfredo Barragan on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class FavoriteViewCell: UITableViewCell {
    public lazy var titleLabel : UILabel = {
       var titleLabel = UILabel()
       return titleLabel
    }()
    public lazy var locationLabel : UILabel = {
        var locationLabel = UILabel()
        return locationLabel
    }()
    public lazy var salaryLabel : UILabel = {
        var salaryLabel = UILabel()
        return salaryLabel
    }()
    public lazy var deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.backgroundColor = .blue
        return deleteButton
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("error")
    }
    private func commonInit() {
        setupLocationLabel()
        setupSalaryLabel()
        setupTitleLabel()
        setupDeleteButton()
    }
    private func setupLocationLabel() {
        addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
    private func setupSalaryLabel() {
        addSubview(salaryLabel)
        salaryLabel.translatesAutoresizingMaskIntoConstraints = false
        salaryLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10).isActive = true
        salaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        salaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -200).isActive = true
        salaryLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: salaryLabel.bottomAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100).isActive = true 
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    private func setupDeleteButton() {
        addSubview(deleteButton)
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.topAnchor.constraint(equalTo: salaryLabel.bottomAnchor, constant: 10).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
        @objc func deleteButtonPressed(sender: UIButton) {
            JobModel.deleteJob(index: sender.tag)
        }
    }

