//
//  SearchView.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
protocol FilterButtonDelegate: AnyObject {
    func filterPressed()
}

class SearchView: UIView {

    public lazy var jobSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    public lazy var filterButton: UIButton = {
    let filterButton =  UIButton()
        filterButton.titleLabel?.textColor = .blue
        filterButton.setTitle("Customize Search", for: .normal)
        filterButton.titleLabel?.font = UIFont(name: "Baskerville-Bold", size: 18)!
        filterButton.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
        filterButton.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
        return filterButton
    }()

    public lazy var jobsTableView: UITableView = {
        let jobsTableView = UITableView()
            jobsTableView.backgroundColor = .clear
        return jobsTableView
    }()


weak var delegate: FilterButtonDelegate?
    
override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
      self.jobsTableView.register(JobTableViewCell.self, forCellReuseIdentifier: "jobCell")
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
    setupSearchBarConstrains()
    setupFilterButtonConstrains()
    setupTableViewConstrains()
    
}

private func setupSearchBarConstrains(){
        addSubview(jobSearchBar)
    jobSearchBar.translatesAutoresizingMaskIntoConstraints = false
    jobSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    jobSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    jobSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    jobSearchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupFilterButtonConstrains(){
        addSubview(filterButton)
        
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.topAnchor.constraint(equalTo: jobSearchBar.bottomAnchor, constant: 5).isActive = true
        filterButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        filterButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        filterButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    private func setupTableViewConstrains(){
        addSubview(jobsTableView)
        jobsTableView.translatesAutoresizingMaskIntoConstraints = false
        jobsTableView.topAnchor.constraint(equalTo: filterButton.bottomAnchor, constant: 5).isActive = true
        jobsTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        jobsTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        jobsTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    @objc func filterButtonPressed() {
        delegate?.filterPressed()
    }

}
