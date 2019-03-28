//
//  WebViewController.swift
//  Hackathon2019~Work4NYC
//
//  Created by Biron Su on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    var urlLink = String()
    let webView = WebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        if let url = URL(string: urlLink) {
            let request = URLRequest(url: url)
            webView.newView.load(request)
        } else {
            print("bad url")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if let url = URL(string: urlLink) {
            let request = URLRequest(url: url)
            webView.newView.load(request)
        } else {
            print("bad url")
        }
    }
}
