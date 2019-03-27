//
//  FilterViewController.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    let filterView = FilterView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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
