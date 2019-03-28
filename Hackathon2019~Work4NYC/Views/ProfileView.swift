//
//  ProfileView.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/28/19.

//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
protocol StepperDelegate: AnyObject {
    func stepperDidChangeValue(sender:UIStepper)
}

class ProfileView: UIView {
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    
    lazy var quotaStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 0.0
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(stepperPressed), for: .valueChanged)
        return stepper
    }()
    lazy var quotaLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = String(0)
        label.font = UIFont.systemFont(ofSize: 75)
        return label
    }()
    
    lazy var setQuotaLabelTitle: UILabel = {
        let label = UILabel()
        label.text = "Change your quota:"
        return label
    }()
    
    lazy var setQuotaLabel: UILabel = {
        let label = UILabel()
        label.text = String(0)
        return label
    }()
    func timerCircle (strokeValue: CGFloat, radius: CGFloat?){
        let y = center.y * 0.5
        let x = center.x
        let position = CGPoint(x: x, y: y)
        if let radius = radius {
            let circularPath = UIBezierPath(arcCenter: .zero, radius: radius, startAngle:  0, endAngle: 2 * CGFloat.pi, clockwise: true)
            trackLayer.path = circularPath.cgPath
            trackLayer.strokeColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            trackLayer.lineCap = CAShapeLayerLineCap.round
            trackLayer.fillColor = UIColor.clear.cgColor
            trackLayer.lineWidth = 20
            trackLayer.position = position
            layer.addSublayer(trackLayer)
            shapeLayer.path = circularPath.cgPath
            shapeLayer.strokeColor = #colorLiteral(red: 0, green: 0.6274659038, blue: 0, alpha: 1)
            shapeLayer.lineCap = CAShapeLayerLineCap.round
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineWidth = 20
            shapeLayer.strokeEnd = strokeValue
            shapeLayer.position = position
            shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
            layer.addSublayer(shapeLayer)
        }
    }
    weak var delegate: StepperDelegate?
    //    func setTimerGraphics () {
    //        shapeLayer.strokeEnd = CGFloat(1)
    ////        if Int(MainTimer.time) == (((Game.lengthSelected / 2) * 60) - (((Game.lengthSelected / 2) * 60) / 10)) {
    ////            shapeLayer.strokeColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    ////            trackLayer.strokeColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    ////        }
    ////        if Int(MainTimer.time) == (Game.lengthSelected / 2) * 60 {
    ////            shapeLayer.strokeColor = #colorLiteral(red: 1, green: 0, blue: 0.1359238923, alpha: 1)
    ////            trackLayer.strokeColor = #colorLiteral(red: 1, green: 0.4121969342, blue: 0.4527801871, alpha: 1)
    ////        }
    //    }
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupStepper()
        setupQuotaLabel()
        setupSetQuotaTitleLabel()
        setupSetQuotaLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStepper() {
        addSubview(quotaStepper)
        quotaStepper.translatesAutoresizingMaskIntoConstraints = false
        quotaStepper.centerXAnchor.constraint(equalTo: centerXAnchor, constant: (bounds.width / 4)).isActive = true
        quotaStepper.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    func setupQuotaLabel() {
        addSubview(quotaLabel)
        quotaLabel.translatesAutoresizingMaskIntoConstraints = false
        quotaLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -(bounds.height) / 4).isActive = true
        quotaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        quotaLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
    }
    
    func setupSetQuotaTitleLabel() {
        addSubview(setQuotaLabelTitle)
        setQuotaLabelTitle.centerYAnchor.constraint(equalTo: quotaStepper.centerYAnchor).isActive = true
        setQuotaLabelTitle.translatesAutoresizingMaskIntoConstraints = false
        setQuotaLabelTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
    }
    func setupSetQuotaLabel() {
        addSubview(setQuotaLabel)
        setQuotaLabel.translatesAutoresizingMaskIntoConstraints = false
        setQuotaLabel.centerYAnchor.constraint(equalTo: setQuotaLabelTitle.centerYAnchor).isActive = true
        setQuotaLabel.leadingAnchor.constraint(equalTo: setQuotaLabelTitle.trailingAnchor, constant: 20).isActive = true
    }
    @objc func stepperPressed(sender:UIStepper) {
        delegate?.stepperDidChangeValue(sender: sender)
    }
}
