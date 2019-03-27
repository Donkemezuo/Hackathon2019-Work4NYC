//
//  FavoriteViewController.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
let controlView = FavoriteView()
    var jobs = [Job]() {
        didSet{
            self.controlView.favoriteView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(controlView)
        view.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.2261782289, alpha: 1)
        controlView.favoriteView.delegate = self
        controlView.favoriteView.dataSource = self
    }
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let favoriteCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteViewCell else { return UITableViewCell()}
        favoriteCell.locationLabel.text = "Job Location"
        favoriteCell.salaryLabel.text = "Job Salary"
        favoriteCell.titleLabel.text = "Job Title"
        favoriteCell.backgroundColor = .clear
        favoriteCell.layer.borderWidth = 2
        favoriteCell.layer.cornerRadius = 1
        return favoriteCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
