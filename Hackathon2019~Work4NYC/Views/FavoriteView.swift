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
        commonInit()
        
    }
        required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
        func commonInit(){
        backgroundColor = .white
//        self.myCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "JobTableViewCell")
        
    }
    func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
        
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
            
            print("Top: \(topInset)")
            print("Bottom: \(bottomInset)")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }

}
