//
//  JobsTimelineViewController.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/28/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class JobsTimelineViewController: UIViewController {
    let jobsTimelineView = JobsTimeLineView()
    private  var tapGuesture: UITapGestureRecognizer!
    
    private var jobs = [Job](){
        didSet {
            DispatchQueue.main.async {
                self.jobsTimelineView.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(jobsTimelineView)
        view.backgroundColor = #colorLiteral(red: 0.72706002, green: 0, blue: 0.1062836573, alpha: 1).withAlphaComponent(0.5)
        jobsTimelineView.collectionView.delegate = self
        jobsTimelineView.collectionView.dataSource = self
        setupJobSearchAction()
        getJobs()
    }
    
    
    
    private func setupJobSearchAction(){
        jobsTimelineView.searchJobButton.isUserInteractionEnabled = true
        tapGuesture = UITapGestureRecognizer(target: self, action: #selector(searchJobsButtonPressed))
        jobsTimelineView.searchJobButton.addGestureRecognizer(tapGuesture)
    }
    
    @objc private func searchJobsButtonPressed(){
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
    private func getJobs(){
        JobAPIClient.getJobs(keyword: "") { (error, jobs) in
            if let error = error {
                self.showAlert(title: "Error", message:"Error: \(error.localizedDescription)")
            } else {
                if let jobs = jobs {
                    self.jobs = jobs
                }
            }
        }
    }
    
    }

extension JobsTimelineViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let jobCell = collectionView.dequeueReusableCell(withReuseIdentifier: "jobsCVCell", for: indexPath) as? JobsCollectionViewCell else {return UICollectionViewCell()}
        let job = jobs[indexPath.row]
        jobCell.jobLocation.text = "Location: \(job.work_location)"
        jobCell.jobPosition.text = "Position: \(job.business_title)"
        jobCell.salary.text = "Salary type: \(job.salary_frequency)"
        jobCell.postedDate.text = "Salary: $\(job.salary_range_from)"
        jobCell.layer.borderWidth = 5
        jobCell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        jobCell.layer.cornerRadius = 10
        
        return jobCell
    }
    
    
}
