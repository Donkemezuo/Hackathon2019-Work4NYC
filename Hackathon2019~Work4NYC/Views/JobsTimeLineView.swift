//
//  JobsTimeLineView.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/28/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class JobsTimeLineView: UIView {

    public lazy var collectionView: UICollectionView = {
        let cellLayout = UICollectionViewFlowLayout()
        cellLayout.scrollDirection = .horizontal
        cellLayout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        cellLayout.itemSize = CGSize.init(width: 400, height: 500)
        let jobsCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: cellLayout)
        
        jobsCollectionView.backgroundColor = #colorLiteral(red: 0.3589735031, green: 0.8146317601, blue: 0.9653592706, alpha: 1)
        return jobsCollectionView
    }()
    
    public lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.backgroundColor = .white
        likeButton.layer.cornerRadius = 10.0
        likeButton.setImage(UIImage.init(named: "icons8-checkmark_filled"), for: .normal)
        likeButton.setTitleColor(.green, for: .selected)
        return likeButton
    }()
    
    public lazy var disLikeButton: UIButton = {
        let disLikeButton = UIButton()
        disLikeButton.backgroundColor = .white
        disLikeButton.layer.cornerRadius = 10.0
        disLikeButton.setImage(UIImage.init(named: "icons8-delete_sign_filled"), for: .normal)
        return disLikeButton
    }()
    
    public lazy var searchJobButton: UILabel = {
        let searchButton = UILabel()
        searchButton.textColor = UIColor.blue.withAlphaComponent(0.8)
        searchButton.text = " Search Jobs "
        searchButton.textAlignment = .center
        searchButton.layer.cornerRadius = 10.0
        searchButton.layer.borderWidth = 2.0
        searchButton.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        searchButton.font = UIFont.boldSystemFont(ofSize: 20)
        return searchButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        collectionView.register(JobsCollectionViewCell.self, forCellWithReuseIdentifier: "jobsCVCell")
        commonInt()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInt()
    }
    
    private func commonInt(){
        
        setConstrains()
        
    }
    
    private func setConstrains() {
        setSearchJobsButtonConstrains()
       setCollectionViewConstrains()
        setupDislikeButtonConstrains()
       setupLikeButtonConstrains()
    
        
    }
    
    private func setSearchJobsButtonConstrains(){
        addSubview(searchJobButton)
        searchJobButton.translatesAutoresizingMaskIntoConstraints = false
        searchJobButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        searchJobButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        searchJobButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setCollectionViewConstrains(){
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: searchJobButton.bottomAnchor, constant: 5).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
    }
    
    
    private func setupDislikeButtonConstrains(){
        addSubview(disLikeButton)
        disLikeButton.translatesAutoresizingMaskIntoConstraints = false
        disLikeButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10).isActive = true
        disLikeButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        disLikeButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        disLikeButton.heightAnchor.constraint(equalToConstant: 125).isActive = true
    }
    
    
    private func setupLikeButtonConstrains(){
        addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10).isActive = true
        likeButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 125).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 150).isActive = true

    }

    
 

    
}
