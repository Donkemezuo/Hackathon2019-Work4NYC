//
//  FilterViewController.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

enum SalaryType: String {
    case hourly = "Hourly"
    case daily = "Daily"
    case annual = "Annual"
}

enum ScheduleType: String {
    case partTime = "P"
    case fullTime = "F"
}
class FilterViewController: UIViewController {
    
    let filterView = FilterView()
    weak var filterDelegate: FilterVCDelegate?
    var salaryType: SalaryType?
    var scheduleType: ScheduleType?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        filterView.delegate = self
    }
    
    func setupView() {
        view.addSubview(filterView)
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7270708476)
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
        filterView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        filterView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        filterView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}

extension FilterViewController: FilterViewButtonsDelegate {
    func hourlyButtonPressed() {
        filterView.hourlyButton.backgroundColor = .gray
        filterView.dailyButton.backgroundColor = .white
        filterView.annualButton.backgroundColor = .white
        salaryType = .hourly
    }
    
    func dailyButtonPressed() {
        filterView.dailyButton.backgroundColor = .gray
        filterView.hourlyButton.backgroundColor = .white
        filterView.annualButton.backgroundColor = .white
        salaryType = .daily
    }
    
    func annualButtonPressed() {
        filterView.annualButton.backgroundColor = .gray
        filterView.hourlyButton.backgroundColor = .white
        filterView.dailyButton.backgroundColor = .white
        salaryType = .annual
    }
    
    func partTimeButtonPressed() {
        filterView.partTimeButton.backgroundColor = .gray
        filterView.fullTimeButton.backgroundColor = .white
        scheduleType = .partTime
    }
    
    func fullTimeButtonPressed() {
        filterView.fullTimeButton.backgroundColor = .gray
        filterView.partTimeButton.backgroundColor = .white
        scheduleType = .fullTime
    }
    
    func okayButtonPressed() {
        filterDelegate?.filterWereSelected(salaryType: salaryType?.rawValue, scheduleType: scheduleType?.rawValue)
        self.dismiss(animated: true)
    }
    
    func cancelButtonPressed() {
        self.dismiss(animated: true)
    }
    
    
}
