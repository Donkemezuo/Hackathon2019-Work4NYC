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
    var setQuota = Double()
    var quota = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileView)
        profileView.delegate = self
        profileView.timerCircle(strokeValue: CGFloat(quota), radius: view.bounds.width / 4)
        //        setupView()
    }
    func setQuotaCircle() {
        profileView.shapeLayer.strokeEnd = CGFloat(quota / setQuota)
    }
}

extension ProfileViewController: StepperDelegate {
    func stepperDidChangeValue(sender: UIStepper) {
        setQuota = sender.value
        profileView.setQuotaLabel.text = String(sender.value)
        setQuotaCircle()
    }

}
