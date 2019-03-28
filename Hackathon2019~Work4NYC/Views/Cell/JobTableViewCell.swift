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
        positionLabel.numberOfLines = 0
        positionLabel.font = UIFont(name: "Helvetica", size: 18)!
        return positionLabel
    }()
    
    public lazy var jobLocation: UILabel = {
        let jobLocation = UILabel()
        jobLocation.numberOfLines = 0
        jobLocation.font = UIFont(name: "Helvetica", size: 18)!
        return jobLocation
    }()
    
    public lazy var salary: UILabel = {
        let salary = UILabel()
        salary.font = UIFont(name: "Helvetica", size: 18)!
        return salary
    }()
    
    public lazy var postedDate: UILabel = {
        let postedDate = UILabel()
        return postedDate
    }()
    
    public lazy var saveButton: UIButton = {
        let saveButton = UIButton()
        saveButton.titleLabel?.font = UIFont(name: "Helvetica", size: 18)!
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
        jobPosition.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        jobPosition.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        jobPosition.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupPostedDateLabelConstrains(){
        addSubview(postedDate)
        postedDate.translatesAutoresizingMaskIntoConstraints = false
        postedDate.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        postedDate.leadingAnchor.constraint(equalTo: jobPosition.trailingAnchor).isActive = true
        postedDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        postedDate.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupJobLocationConstrains(){
        addSubview(jobLocation)
        jobLocation.translatesAutoresizingMaskIntoConstraints = false
        jobLocation.topAnchor.constraint(equalTo: jobPosition.bottomAnchor, constant: 5).isActive = true
        jobLocation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        jobLocation.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupSalaryLabelConstrains(){
        addSubview(salary)
        salary.translatesAutoresizingMaskIntoConstraints = false
        salary.topAnchor.constraint(equalTo: jobLocation.bottomAnchor, constant: 10).isActive = true
        salary.leadingAnchor.constraint(equalTo: leadingAnchor,  constant: 15).isActive = true
        salary.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100).isActive = true
        salary.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    


    private func setupSaveJobLabelConstrains(){
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: jobLocation.bottomAnchor, constant: 10).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: salary.trailingAnchor).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    @objc func saveButtonPressed(sender: UIButton) {
        let job = Job(agency: "g", business_title: "g", job_description: "g", job_id: "g", full_time_part_time_indicator: "g", minimum_qual_requirements: "G", salary_frequency: "g", salary_range_from: "g", salary_range_to: "G", work_location: "g")
            JobModel.addJob(job: job)
    }
}
