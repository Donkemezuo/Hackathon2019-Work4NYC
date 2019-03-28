//
//  ViewController.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

protocol FilterVCDelegate: AnyObject {
    func filterWereSelected(salaryType: String?, scheduleType: String?)
}
class SearchViewController: UIViewController {
    let searchView = SearchView()

    var jobs = [Job]() {
        didSet {
            DispatchQueue.main.async {
                self.searchView.jobsTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        view.addSubview(searchView)
        view.backgroundColor = #colorLiteral(red: 0.72706002, green: 0, blue: 0.1062836573, alpha: 1)
        super.viewDidLoad()
        searchView.jobsTableView.delegate = self
        searchView.jobsTableView.dataSource = self
        populateData(keyword: "")
        searchView.delegate = self
    }
    


}
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
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


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let jobCell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath) as? JobTableViewCell else {return UITableViewCell()}
        let job = jobs[indexPath.row]
        jobCell.jobLocation.text = job.work_location
        jobCell.jobPosition.text = job.business_title
        jobCell.salary.text = job.salary_frequency
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.job = self.jobs[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        populateData(keyword: searchBar.text ?? "")
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            populateData(keyword: "")
        }
    }
}

extension SearchViewController: FilterButtonDelegate{
    func filterPressed() {
        let filterVC = FilterViewController()
        filterVC.filterDelegate = self
        filterVC.modalPresentationStyle = .overFullScreen
        present(filterVC, animated: true)
    }
}
extension SearchViewController: FilterVCDelegate {
    func filterWereSelected(salaryType: String?, scheduleType: String?) {
        if let salaryType = salaryType {
           jobs = jobs.filter{$0.salary_frequency == salaryType}
        }
        if let scheduleType = scheduleType {
            jobs = jobs.filter{$0.full_time_part_time_indicator == scheduleType}
        }
        
    }
    
    
}
