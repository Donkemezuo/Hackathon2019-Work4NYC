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
//    var jobs = [Job]()
    var jobs = [Job]() {
        didSet{
            DispatchQueue.main.async {
        self.controlView.favoriteView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(controlView)
        view.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.2261782289, alpha: 1)
        controlView.favoriteView.delegate = self
        controlView.favoriteView.dataSource = self
        populateData(keyword: "")
    }
    func populateData(keyword: String) {
        JobAPIClient.getJobs(keyword: keyword) { (error, data) in
            if let error = error {
                print("Error getting data : \(error)")
            } else if let data = data {
                self.jobs = data
            }
        }
    }
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let favoriteCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteViewCell else { return UITableViewCell()}
        favoriteCell.locationLabel.text = "Job Location"
        favoriteCell.salaryLabel.text = "Job Salary"
        favoriteCell.titleLabel.text = "Job Title"
        favoriteCell.backgroundColor = .clear
        favoriteCell.layer.borderWidth = 2
        favoriteCell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        favoriteCell.layer.cornerRadius = 5
        return favoriteCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.job = self.jobs[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
