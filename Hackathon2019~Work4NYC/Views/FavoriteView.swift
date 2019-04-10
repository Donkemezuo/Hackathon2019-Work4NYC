//
//  FavoriteView.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class FavoriteView: UIView {
    public lazy var favoriteView: UITableView = {
        let favoriteTableView = UITableView()
        return favoriteTableView
    }()
        override init(frame: CGRect) {
            super.init(frame: UIScreen.main.bounds)
            self.favoriteView.register(FavoriteViewCell.self, forCellReuseIdentifier: "FavoriteCell")
            commonInit()
        }
        required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
        func commonInit(){
        self.backgroundColor = #colorLiteral(red: 0.3589735031, green: 0.8146317601, blue: 0.9653592706, alpha: 1)
        setupTableViewConstrains()
            
    }

    private func setupTableViewConstrains(){
        addSubview(favoriteView)
        favoriteView.translatesAutoresizingMaskIntoConstraints = false
        favoriteView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        favoriteView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        favoriteView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        favoriteView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}


