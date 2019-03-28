//
//  ProfileViewController.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/28/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileView = ProfileView()
    var setQuota = 20.0
    var quota = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileView)
        view.backgroundColor = .white
        quota = JobsTimelineViewController.quota
        print(quota)
        profileView.delegate = self
        profileView.timerCircle(strokeValue: CGFloat(quota), radius: view.bounds.width / 4)
        //        setupView()
    }
    func setQuotaCircle() {
        profileView.shapeLayer.strokeEnd = CGFloat(quota / setQuota)
    }
    override func viewDidAppear(_ animated: Bool) {
        profileView.timerCircle(strokeValue: CGFloat(quota), radius: view.bounds.width / 4)
    }
}

extension ProfileViewController: StepperDelegate {
    func stepperDidChangeValue(sender: UIStepper) {
        setQuota = sender.value
        profileView.setQuotaLabel.text = String(sender.value)
        setQuotaCircle()
    }

}
