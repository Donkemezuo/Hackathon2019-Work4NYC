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
    var jobs = [Job]() {
        didSet{
            self.controlView.favoriteView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(controlView)
        
    }
    

   

}
