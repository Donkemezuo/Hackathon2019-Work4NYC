//
//  DetailViewController.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var job: Job?
    let detailView = DetailView()
    let webViewController = WebViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        detailView.nycGovButton.addTarget(self, action: #selector(nycGovSegue), for: .touchUpInside)
        detailView.monsterButton.addTarget(self, action: #selector(monsterSegue), for: .touchUpInside)
        detailView.indeedButton.addTarget(self, action: #selector(indeedSegue), for: .touchUpInside)
        detailView.linkedInButton.addTarget(self, action: #selector(linkedInSegue), for: .touchUpInside)
        updateUI()
    }
    private func updateUI() {
        detailView.titleLabel.text = job?.business_title
        detailView.companyName.text = job?.agency
        detailView.descriptionTextView.text = job?.job_description ?? "N/A"
        detailView.salaryLabel.text = "Salary: (\(job?.salary_frequency ?? "N/A")), From: $\(job?.salary_range_from ?? "N/A")-$\(job?.salary_range_to ?? "N/A"))"
        if job?.full_time_part_time_indicator?.capitalized == "F" {
            detailView.scheduleTypeLabel.text = "Full-Time"
        } else if job?.full_time_part_time_indicator?.capitalized == "P" {
            detailView.scheduleTypeLabel.text = "Part-Time"
        } else {
            detailView.scheduleTypeLabel.text = "N/A"
        }
    }
    @objc func nycGovSegue() {
        let keyword = job?.business_title.replacingOccurrences(of: " ", with: "")

        let urlLink = "https://a127-jobs.nyc.gov/index_new.html?keyword=\(keyword!)"
        webViewController.urlLink = urlLink
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
    @objc func monsterSegue() {
        let keyword = job?.business_title.replacingOccurrences(of: " ", with: "")

        let urlLink = "https://www.monster.com/jobs/search?q=\(keyword!)"
        webViewController.urlLink = urlLink
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
    @objc func indeedSegue() {
        let keyword = job?.business_title.replacingOccurrences(of: " ", with: "")

        let urlLink = "https://www.indeed.com/jobs?q=\(keyword!)&l="
        webViewController.urlLink = urlLink
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
    @objc func linkedInSegue() {
        let keyword = job?.business_title.replacingOccurrences(of: " ", with: "")

        let urlLink = "https://www.linkedin.com/jobs/search?keywords=\(keyword!)&pageNum=0&position=1"
        webViewController.urlLink = urlLink
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
}
