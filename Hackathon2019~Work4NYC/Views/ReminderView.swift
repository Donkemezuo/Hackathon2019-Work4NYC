//
//  ReminderView.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/28/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

protocol ReminderButtonsDelegates: AnyObject {
    func okayPressed(datePicker: UIDatePicker)
    func cancelPressed()
}
class ReminderView: UIView {

    lazy var reminderDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.date = Date()
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        return datePicker
    }()
    
    lazy var okayButton: UIButton = {
        let button = UIButton()
        button.setTitle("Okay", for: .normal)
        button.addTarget(self, action: #selector(okayButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = #colorLiteral(red: 0.3410598636, green: 0.7661687136, blue: 0.9684112668, alpha: 1)
        setupDatePicker()
        setupOkayButton()
        setupCancelButton()
    }
    
    weak var delegate: ReminderButtonsDelegates?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupDatePicker() {
        addSubview(reminderDatePicker)
        reminderDatePicker.translatesAutoresizingMaskIntoConstraints = false
        reminderDatePicker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        reminderDatePicker.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setupOkayButton() {
        addSubview(okayButton)
        okayButton.translatesAutoresizingMaskIntoConstraints = false
        okayButton.topAnchor.constraint(equalTo: reminderDatePicker.bottomAnchor, constant: 10).isActive = true
        okayButton.centerXAnchor.constraint(equalTo: reminderDatePicker.centerXAnchor).isActive = true
        
    }
    
    func setupCancelButton() {
        addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: okayButton.bottomAnchor, constant: 10).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: reminderDatePicker.centerXAnchor).isActive = true
    }
    
    @objc func okayButtonPressed() {
        delegate?.okayPressed(datePicker: reminderDatePicker)
    }
    
    @objc func cancelButtonPressed() {
        delegate?.cancelPressed()
    }
}
