//
//  FilterView.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

protocol FilterViewButtonsDelegate: AnyObject {
    func okayButtonPressed()
    func cancelButtonPressed()
    func hourlyButtonPressed()
    func dailyButtonPressed()
    func annualButtonPressed()
    func partTimeButtonPressed()
    func fullTimeButtonPressed()
}

class FilterView: UIView {
    
    lazy var salaryTypeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Salary type:"
        return label
    }()
    lazy var scheduleTypeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Schedule type:"
        return label
    }()
    lazy var hourlyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hourly", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .selected)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(hourlyPressed), for: .touchUpInside)
        return button
    }()
    lazy var dailyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Daily", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .selected)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(dailyPressed), for: .touchUpInside)
        return button
    }()
    lazy var annualButton: UIButton = {
        let button = UIButton()
        button.setTitle("Annual", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .selected)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(annualPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var partTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Part time", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .selected)
        button.backgroundColor = .white
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(partTimePressed), for: .touchUpInside)
        return button
    }()
    
    lazy var fullTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Full time", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .selected)
        button.backgroundColor = .white
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(fullTimePressed), for: .touchUpInside)
        return button
    }()
    
    lazy var okayButton: UIButton = {
      let button = UIButton()
        button.setTitle("Okay", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(okayPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
       let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        return button
    }()
    weak var delegate: FilterViewButtonsDelegate?
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        setupSalaryTypeLabel()
        setupDailyButton()
        setupHourlyButton()
        setupAnnualButton()
        setupScheduleTypeLabel()
        setupPartTimeButton()
        setupFullTimeButton()
        setupCancelButton()
        setupOkayButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSalaryTypeLabel() {
        addSubview(salaryTypeLabel)
        salaryTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        salaryTypeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        salaryTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        salaryTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    func setupDailyButton(){
        addSubview(dailyButton)
        dailyButton.translatesAutoresizingMaskIntoConstraints = false
        dailyButton.centerXAnchor.constraint(equalTo: salaryTypeLabel.centerXAnchor).isActive = true
        dailyButton.topAnchor.constraint(equalTo: salaryTypeLabel.bottomAnchor, constant: 10).isActive = true
        dailyButton.widthAnchor.constraint(equalToConstant: (frame.width * 0.9) / 3).isActive = true
        
    }
    func setupHourlyButton() {
        addSubview(hourlyButton)
        hourlyButton.translatesAutoresizingMaskIntoConstraints = false
        hourlyButton.centerYAnchor.constraint(equalTo: dailyButton.centerYAnchor).isActive = true
        hourlyButton.trailingAnchor.constraint(equalTo: dailyButton.leadingAnchor).isActive = true
        hourlyButton.widthAnchor.constraint(equalToConstant: (frame.width * 0.9) / 3).isActive = true
    }
    func setupAnnualButton() {
        addSubview(annualButton)
        annualButton.translatesAutoresizingMaskIntoConstraints = false
        annualButton.centerYAnchor.constraint(equalTo: dailyButton.centerYAnchor).isActive = true
        annualButton.leadingAnchor.constraint(equalTo: dailyButton.trailingAnchor).isActive = true
        annualButton.widthAnchor.constraint(equalToConstant: (frame.width * 0.9) / 3).isActive = true
    }
    func setupScheduleTypeLabel() {
        addSubview(scheduleTypeLabel)
        scheduleTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduleTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        scheduleTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        scheduleTypeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    func setupPartTimeButton() {
        addSubview(partTimeButton)
        partTimeButton.translatesAutoresizingMaskIntoConstraints = false
        partTimeButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        partTimeButton.topAnchor.constraint(equalTo: scheduleTypeLabel.bottomAnchor, constant: 10).isActive = true
        partTimeButton.widthAnchor.constraint(equalToConstant: (frame.width * 0.9) / 2).isActive = true
    }
    
    func setupFullTimeButton() {
        addSubview(fullTimeButton)
        fullTimeButton.translatesAutoresizingMaskIntoConstraints = false
        fullTimeButton.centerYAnchor.constraint(equalTo: partTimeButton.centerYAnchor).isActive = true
        fullTimeButton.leadingAnchor.constraint(equalTo: partTimeButton.trailingAnchor).isActive = true
        fullTimeButton.widthAnchor.constraint(equalToConstant: (frame.width * 0.9) / 2).isActive = true
        
    }
    
    func setupCancelButton() {
        addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -75).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setupOkayButton() {
        addSubview(okayButton)
        okayButton.translatesAutoresizingMaskIntoConstraints = false
        okayButton.centerXAnchor.constraint(equalTo: cancelButton.centerXAnchor).isActive = true
        okayButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -20).isActive = true
    }
    
    @objc func cancelPressed() {
        delegate?.cancelButtonPressed()
    }
    @objc func okayPressed() {
        delegate?.okayButtonPressed()
    }
    
    @objc func hourlyPressed() {
        delegate?.hourlyButtonPressed()
    }
    
    @objc func dailyPressed() {
        delegate?.dailyButtonPressed()
    }
    
    @objc func annualPressed() {
        delegate?.annualButtonPressed()
    }
    
    @objc func partTimePressed() {
        delegate?.partTimeButtonPressed()
    }
    
    @objc func fullTimePressed() {
        delegate?.fullTimeButtonPressed()
    }
    
}
