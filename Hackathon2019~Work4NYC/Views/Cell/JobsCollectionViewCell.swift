//
//  JobsCollectionViewCell.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/28/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class JobsCollectionViewCell: UICollectionViewCell {
    
    public lazy var jobPosition: UILabel = {
        let positionLabel = UILabel()
        positionLabel.numberOfLines = 0
        return positionLabel
    }()
    
    public lazy var jobLocation: UILabel = {
        let jobLocation = UILabel()
        jobLocation.adjustsFontSizeToFitWidth = true
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
    
    public lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "hiring")
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        commonInt()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInt()
    }
    
    private func commonInt(){
        
        setConstrains()
        
    }
    private func setConstrains(){
        setupJobPositionConstrains()
        setupJobLocationConstrains()
         setupPostedDateLabelConstrains()
        setupSalaryLabelConstrains()
        setImageViewConstrains()
    }
    
    
    private func setupJobPositionConstrains(){
        addSubview(jobPosition)
        jobPosition.translatesAutoresizingMaskIntoConstraints = false
        jobPosition.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        jobPosition.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        jobPosition.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
      
    }
    
    private func setupJobLocationConstrains(){
        addSubview(jobLocation)
        jobLocation.translatesAutoresizingMaskIntoConstraints = false
        jobLocation.topAnchor.constraint(equalTo: jobPosition.bottomAnchor, constant: 10).isActive = true
        jobLocation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        jobLocation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        jobLocation.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupPostedDateLabelConstrains(){
        addSubview(postedDate)
        postedDate.translatesAutoresizingMaskIntoConstraints = false
        postedDate.topAnchor.constraint(equalTo: jobLocation.bottomAnchor, constant: 10).isActive = true
        postedDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        postedDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }

    
    private func setupSalaryLabelConstrains(){
        addSubview(salary)
        salary.translatesAutoresizingMaskIntoConstraints = false
        salary.topAnchor.constraint(equalTo: postedDate.bottomAnchor, constant: 10).isActive = true
        salary.leadingAnchor.constraint(equalTo: leadingAnchor,  constant: 10).isActive = true
        salary.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        salary.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setImageViewConstrains(){
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: salary.bottomAnchor, constant: 10).isActive = true
        image.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        image.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        image.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }

  

}
