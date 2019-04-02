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
    var quota = 0.0
    
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
//        UserDefaults.standard.removeObject(forKey: "setQuota")
//        UserDefaults.standard.removeObject(forKey: "quota")
        if let quota = UserDefaults.standard.object(forKey: "quota") as? Double {
            self.quota = quota
        }
        jobsTimelineView.collectionView.delegate = self
        jobsTimelineView.collectionView.dataSource = self
        setupJobSearchAction()
        getJobs()
        saveJob()
        deleteJob()
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
        counter += 1
        quota += 1
        UserDefaults.standard.set(quota, forKey: "quota")
        let indexPath = IndexPath(row: counter, section: 0)
        jobsTimelineView.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
       let job = jobs[indexPath.row]
        JobModel.addJob(job: job)
        jobsTimelineView.likeButton.backgroundColor = .green
    
    }
    
    private func deleteJob(){
       jobsTimelineView.disLikeButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
    }
    
    @objc private func deleteButtonPressed(){
        counter += 1
        let indexPath = IndexPath(row: counter, section: 0)
        jobsTimelineView.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        jobsTimelineView.disLikeButton.backgroundColor = .red
        
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
