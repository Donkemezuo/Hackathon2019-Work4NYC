//
//  FavoriteView.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class FavoriteView: UIView {
    public lazy var favoriteView: UITableView = {
        let favoriteTableView = UITableView()
        return favoriteTableView
        }()
        override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        self.favoriteView.register(FavoriteViewCell.self, forCellReuseIdentifier: "FavoriteCell")
        commonInit()
        }
        required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
        func commonInit(){
        backgroundColor = .white
        setupTableViewConstrains()
            
    }
//    func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
//        var topInset = CGFloat(0)
//        var bottomInset = CGFloat(0)
//
//        if #available(iOS 11, *), enableInsets {
//            let insets = self.safeAreaInsets
//            topInset = insets.top
//            bottomInset = insets.bottom
//
//            print("Top: \(topInset)")
//            print("Bottom: \(bottomInset)")
//        }
//
//        translatesAutoresizingMaskIntoConstraints = false
//
//        if let top = top {
//            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
//        }
//        if let left = left {
//            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
//        }
//        if let right = right {
//            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
//        }
//        if let bottom = bottom {
//            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
//        }
//        if height != 0 {
//            heightAnchor.constraint(equalToConstant: height).isActive = true
//        }
//        if width != 0 {
//            widthAnchor.constraint(equalToConstant: width).isActive = true
//        }
    private func setupTableViewConstrains(){
        addSubview(favoriteView)
        favoriteView.translatesAutoresizingMaskIntoConstraints = false
        favoriteView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        favoriteView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        favoriteView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        favoriteView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}


