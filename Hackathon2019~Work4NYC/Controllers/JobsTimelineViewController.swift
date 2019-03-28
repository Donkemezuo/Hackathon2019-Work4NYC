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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(jobsTimelineView)
        view.backgroundColor = .white
        jobsTimelineView.collectionView.delegate = self
        jobsTimelineView.collectionView.dataSource = self
    }
    }

extension JobsTimelineViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let jobCell = collectionView.dequeueReusableCell(withReuseIdentifier: "jobsCVCell", for: indexPath) as? JobsCollectionViewCell else {return UICollectionViewCell()}
        jobCell.jobLocation.text = "NYC"
        jobCell.jobPosition.text = "Manager"
        jobCell.postedDate.text = "2019"
        jobCell.salary.text = "$1000000000"
        jobCell.layer.borderWidth = 5
        jobCell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        jobCell.layer.cornerRadius = 10
        
        return jobCell
    }
    
    
}
