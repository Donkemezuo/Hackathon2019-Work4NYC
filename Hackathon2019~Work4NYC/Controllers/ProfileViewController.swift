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
    var setQuota = 0.0
    var quota = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileView)
        view.backgroundColor = .white
        profileView.setQuotaLabel.text = quota.description
        profileView.delegate = self
        if let quota = UserDefaults.standard.object(forKey: "quota") as? Double {
            self.quota = quota
            print(quota)
        }
        profileView.quotaLabel.text = quota.description
        profileView.timerCircle(strokeValue: CGFloat(quota / setQuota), radius: view.bounds.width / 4)
        setQuotaCircle()
        //        setupView()
    }
    func setQuotaCircle() {
        profileView.shapeLayer.strokeEnd = CGFloat(quota / setQuota)
        if quota >= setQuota / 2 {
            profileView.shapeLayer.strokeColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            profileView.trackLayer.strokeColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }
        if quota == setQuota {
            profileView.shapeLayer.strokeColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            profileView.trackLayer.strokeColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        if let quota = UserDefaults.standard.object(forKey: "quota") as? Double {
            self.quota = quota
        }
        if let setQuota = UserDefaults.standard.object(forKey: "setQuota") as? Double {
            self.setQuota = setQuota
            print(setQuota)
        }
        profileView.quotaLabel.text = quota.description
        profileView.setQuotaLabel.text = setQuota.description
        setQuotaCircle()

    }
}

extension ProfileViewController: StepperDelegate {
    func stepperDidChangeValue(sender: UIStepper) {
        setQuota += 1
        UserDefaults.standard.set(setQuota, forKey: "setQuota")
        profileView.setQuotaLabel.text = String(setQuota)
        setQuotaCircle()
    }

}
