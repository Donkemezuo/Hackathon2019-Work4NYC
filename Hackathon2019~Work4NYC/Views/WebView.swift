//
//  WebView.swift
//  Hackathon2019~Work4NYC
//
//  Created by Biron Su on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import WebKit

class WebView: UIView {
    lazy var newView: WKWebView = {
        let newView = WKWebView()
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.backgroundColor = .white
        return newView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupConstraints()
        fatalError("init(coder:) failed to implement")
    }
    func setupConstraints() {
        addSubview(newView)
        NSLayoutConstraint.activate([
            newView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            newView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            newView.heightAnchor.constraint(equalTo: self.heightAnchor),
            newView.widthAnchor.constraint(equalTo: self.widthAnchor)
            ])
    }
}
