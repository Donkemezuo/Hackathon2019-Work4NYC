//
//  DetailView.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class DetailView: UIView {
    lazy var companyName: UILabel = {
       let label = UILabel()
        label.text = "Agency Name"
        label.textAlignment = .center
        label.backgroundColor = .gray
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10.0
        return label
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Job Title"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10.0
        return label
    }()
    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Job Description"
        textView.isEditable = false
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 10.0
        return textView
    }()
    lazy var salaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Salary Label"
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10.0
        return label
    }()
    lazy var scheduleTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Schedule Type"
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10.0
        return label
    }()
    lazy var nycGovButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.setTitle("Search\nOn\nNYC GOV", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10.0
        button.backgroundColor = .white
        button.isEnabled = true
        return button
    }()
    lazy var monsterButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.setTitle("Search\nOn\nMonster", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10.0
        button.backgroundColor = .white
        button.isEnabled = true
        return button
    }()
    lazy var indeedButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.setTitle("Search\nOn\nIndeed", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10.0
        button.backgroundColor = .white
        button.isEnabled = true
        return button
    }()
    lazy var linkedInButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.setTitle("Search\nOn\nLinkedIn", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10.0
        button.backgroundColor = .white
        button.isEnabled = true
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .lightGray
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupConstraints()
        fatalError("init(coder:) failed to implement")
    }
}
extension DetailView {
    private func setupConstraints() {
        setupTitleLabel()
        setupAgencyLabel()
        setupDescriptionTextView()
        setupSalaryLabel()
        setupScheduleLabel()
        setupNYCGovButton()
        setupMonsterButton()
        setupIndeedButton()
        setupLinkedInButton()
    }
    private func setupAgencyLabel() {
        addSubview(companyName)
        companyName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            companyName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            companyName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -22),
            companyName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            companyName.heightAnchor.constraint(equalToConstant: 35)
            ])
    }
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -11),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 11),
            titleLabel.heightAnchor.constraint(equalToConstant: 75)
            ])
    }
    private func setupDescriptionTextView() {
        addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20),
            descriptionTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11),
            descriptionTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 300)
            ])
    }
    private func setupSalaryLabel() {
        addSubview(salaryLabel)
        salaryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            salaryLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 20),
            salaryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11),
            salaryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11),
            salaryLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    private func setupScheduleLabel() {
        addSubview(scheduleTypeLabel)
        scheduleTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scheduleTypeLabel.topAnchor.constraint(equalTo: salaryLabel.bottomAnchor, constant: 20),
            scheduleTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11),
            scheduleTypeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11),
            scheduleTypeLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    private func setupNYCGovButton() {
        addSubview(nycGovButton)
        nycGovButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nycGovButton.topAnchor.constraint(equalTo: scheduleTypeLabel.bottomAnchor, constant: 40),
            nycGovButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11),
            nycGovButton.heightAnchor.constraint(equalToConstant: 90),
            nycGovButton.widthAnchor.constraint(equalToConstant: 90)
            ])
    }
    private func setupMonsterButton() {
        addSubview(monsterButton)
        monsterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            monsterButton.topAnchor.constraint(equalTo: scheduleTypeLabel.bottomAnchor, constant: 40),
            monsterButton.leadingAnchor.constraint(equalTo: nycGovButton.trailingAnchor, constant: 11),
            monsterButton.heightAnchor.constraint(equalToConstant: 90),
            monsterButton.widthAnchor.constraint(equalToConstant: 90)
            ])
    }
    private func setupIndeedButton() {
        addSubview(indeedButton)
        indeedButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indeedButton.topAnchor.constraint(equalTo: scheduleTypeLabel.bottomAnchor, constant: 40),
            indeedButton.leadingAnchor.constraint(equalTo: monsterButton.trailingAnchor, constant: 11),
            indeedButton.heightAnchor.constraint(equalToConstant: 90),
            indeedButton.widthAnchor.constraint(equalToConstant: 90)
            ])
    }
    private func setupLinkedInButton() {
        addSubview(linkedInButton)
        linkedInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            linkedInButton.topAnchor.constraint(equalTo: scheduleTypeLabel.bottomAnchor, constant: 40),
            linkedInButton.leadingAnchor.constraint(equalTo: indeedButton.trailingAnchor, constant: 11),
            linkedInButton.heightAnchor.constraint(equalToConstant: 90),
            linkedInButton.widthAnchor.constraint(equalToConstant: 90)
            ])
    }
}
