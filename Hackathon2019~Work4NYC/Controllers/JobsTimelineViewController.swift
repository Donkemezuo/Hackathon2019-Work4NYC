//
//  JobsTimelineViewController.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/28/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class JobsTimelineViewController: UIViewController {
    var counter = 0
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
        view.backgroundColor = #colorLiteral(red: 0.3589735031, green: 0.8146317601, blue: 0.9653592706, alpha: 1)
        jobsTimelineView.collectionView.delegate = self
        jobsTimelineView.collectionView.dataSource = self
        setupJobSearchAction()
        getJobs()
        saveJob()
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
    
    
    private func saveJob(){
        jobsTimelineView.likeButton.addTarget(self, action: #selector(likeJobButtonPressed), for: .touchUpInside)
      
    }
    
    @objc private func likeJobButtonPressed(){
        showAlert(title: "Job Liked", message: "Job saved")
        print("Job liked")
        
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
