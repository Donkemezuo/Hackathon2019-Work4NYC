//
//  ViewController.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    let searchView = SearchView()

    override func viewDidLoad() {
        view.addSubview(searchView)
        view.backgroundColor = #colorLiteral(red: 0.72706002, green: 0, blue: 0.1062836573, alpha: 1)
        super.viewDidLoad()
        searchView.jobsTableView.delegate = self
        searchView.jobsTableView.dataSource = self

    }


}
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let jobCell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath) as? JobTableViewCell else {return UITableViewCell()}
        jobCell.jobLocation.text = "Job location"
        jobCell.jobPosition.text = "Job Position"
        jobCell.postedDate.text = "Date"
        jobCell.salary.text = "Salary"
        jobCell.saveButton.setTitle("Save Job", for: .normal)
        jobCell.backgroundColor = .clear
        jobCell.layer.borderWidth = 2
        jobCell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        jobCell.layer.cornerRadius = 5
        return jobCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
}

