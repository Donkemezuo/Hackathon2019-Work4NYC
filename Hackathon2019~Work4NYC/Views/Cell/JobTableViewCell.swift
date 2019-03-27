//
//  JobTableViewCell.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class JobTableViewCell: UITableViewCell {
    
    public lazy var jobPosition: UILabel = {
        let positionLabel = UILabel()
        return positionLabel
    }()
    
    public lazy var jobLocation: UILabel = {
        let jobLocation = UILabel()
        return jobLocation
    }()
    
    public lazy var salary: UILabel = {
        let salary = UILabel()
        return salary
    }()
    
    public lazy var postedDate: UILabel = {
        let postedDate = UILabel()
        return postedDate
    }()
    
    public lazy var saveButton: UIButton = {
        let saveButton = UIButton()
        return saveButton
    }()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInt()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInt()
        
    }
    
    private func commonInt(){
        
        setConstrains()
        
    }
    
    private func setConstrains() {
        setupJobPositionConstrains()
        setupJobLocationConstrains()
        setupSalaryLabelConstrains()
        setupPostedDateLabelConstrains()
        setupSaveJobLabelConstrains()
        
    }
    
    private func setupJobPositionConstrains(){
        addSubview(jobPosition)
        jobPosition.translatesAutoresizingMaskIntoConstraints = false
        jobPosition.topAnchor.constraint(equalTo: topAnchor).isActive = true
        jobPosition.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        jobPosition.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100).isActive = true
        jobPosition.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupJobLocationConstrains(){
        addSubview(jobLocation)
        jobLocation.translatesAutoresizingMaskIntoConstraints = false
        jobLocation.topAnchor.constraint(equalTo: jobPosition.bottomAnchor, constant: 10).isActive = true
        jobLocation.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        jobLocation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -200).isActive = true
        jobLocation.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupSalaryLabelConstrains(){
        addSubview(salary)
        salary.translatesAutoresizingMaskIntoConstraints = false
        salary.topAnchor.constraint(equalTo: jobLocation.bottomAnchor, constant: 10).isActive = true
        salary.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        salary.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -200).isActive = true
        salary.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupPostedDateLabelConstrains(){
        addSubview(postedDate)
        postedDate.translatesAutoresizingMaskIntoConstraints = false
        postedDate.topAnchor.constraint(equalTo: topAnchor).isActive = true
        postedDate.leadingAnchor.constraint(equalTo: jobPosition.trailingAnchor).isActive = true
        postedDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        postedDate.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }

    private func setupSaveJobLabelConstrains(){
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: jobLocation.bottomAnchor, constant: 10).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: salary.trailingAnchor).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
