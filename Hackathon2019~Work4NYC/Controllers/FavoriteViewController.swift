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
var favoriteJobs = JobModel.getJob()
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
        view.backgroundColor = #colorLiteral(red: 0.3589735031, green: 0.8146317601, blue: 0.9653592706, alpha: 1)
        controlView.favoriteView.delegate = self
        controlView.favoriteView.dataSource = self
        populateData(keyword: "")
        reload()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }
    func populateData(keyword: String) {
        jobs = JobModel.getJob()
    }
    func reload() {
        favoriteJobs = JobModel.getJob()
        controlView.favoriteView.reloadData()
    }
    
    @objc func deleteButtonPressed(sender: UIButton) {
        let optionMenu = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            JobModel.deleteJob(index: sender.tag)
            self.jobs.remove(at: sender.tag)
            self.reload()
            }
        optionMenu.addAction(deleteAction)
        self.present(optionMenu, animated: true, completion: nil)
    }

}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let favoriteCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteViewCell else { return UITableViewCell()}
        let job = favoriteJobs[indexPath.row]
        favoriteCell.locationLabel.text = job.work_location
        favoriteCell.salaryLabel.text = job.salary_range_from
        favoriteCell.titleLabel.text = job.business_title
        favoriteCell.deleteButton.tag = indexPath.row
        favoriteCell.deleteButton.setTitle("Delete Job", for: .normal)
        favoriteCell.deleteButton.addTarget(self, action: #selector(deleteButtonPressed(sender:)), for: .touchUpInside)
        favoriteCell.backgroundColor = #colorLiteral(red: 0.3589735031, green: 0.8146317601, blue: 0.9653592706, alpha: 1)
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

