//
//  HelthViewController.swift
//  MedTracker
//
//  Created by Roman on 18.07.2020.
//  Copyright © 2020 MacBook Air. All rights reserved.
//

import UIKit
import SnapKit
class HelthViewController: UIViewController {
    
    //* MARK: -Propirties
    let spasingBetvinViews = 30
    lazy var heihtOfScrollView = view.frame.height/3
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 1.6)
    
    lazy var scrView: UIScrollView = {
        let scrol = UIScrollView(frame: .zero)
        scrol.backgroundColor = .white
        scrol.frame = self.view.bounds
        scrol.contentSize = contentViewSize
        return scrol
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentViewSize
        return view
    }()
    
    lazy var medLabel: UILabel = {
        let label = UILabel()
        label.text = "Лекарства"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 35)
        label.textAlignment = .left
        label.sizeToFit()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    lazy var measLabel: UILabel = {
           let label = UILabel()
           label.text = "Измерения"
           label.font = UIFont(name: "AmericanTypewriter-Bold", size: 35)
           label.textAlignment = .left
           label.sizeToFit()
           label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
           return label
       }()
    
    lazy var endingLabel: UILabel = {
        let label = UILabel()
        label.text = "Скоро закончаться"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 35)
        label.textAlignment = .left
        label.sizeToFit()
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        let medColVeiw = MedicamentsCollectionView(vc: self)
        let measColView = MedicamentsCollectionView(vc: self)
        let endingColView = MedicamentsCollectionView(vc: self)
        containerView.backgroundColor = #colorLiteral(red: 0.971986115, green: 1, blue: 0.8419048786, alpha: 1)
        scrView.backgroundColor = #colorLiteral(red: 0.971986115, green: 1, blue: 0.8419048786, alpha: 1)
        // Do any additional setup after loading the view.
        view.addSubview(scrView)
        scrView.addSubview(containerView)
        containerView.addSubview(medLabel)
        containerView.addSubview(medColVeiw)
        containerView.addSubview(measLabel)
        containerView.addSubview(measColView)
        containerView.addSubview(endingLabel)
        containerView.addSubview(endingColView)
        medLabel.snp.makeConstraints { (make) in
            make.top.equalTo(containerView).offset(spasingBetvinViews)
            make.left.equalTo(40)
            make.right.equalTo(-40)
        }
        medColVeiw.snp.makeConstraints { (make) in
            make.top.equalTo(medLabel.snp.bottom).offset(spasingBetvinViews)
            make.left.right.equalTo(containerView)
            make.height.equalTo(heihtOfScrollView)
        }
        measLabel.snp.makeConstraints { (make) in
            make.top.equalTo(medColVeiw.snp.bottom).offset(spasingBetvinViews)
            make.left.equalTo(40)
            make.right.equalTo(-40)
        }
        measColView.snp.makeConstraints { (make) in
            make.top.equalTo(measLabel.snp.bottom).offset(spasingBetvinViews)
            make.left.right.equalTo(containerView)
            make.height.equalTo(heihtOfScrollView)
        }
        endingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(measColView.snp.bottom).offset(spasingBetvinViews)
            make.left.equalTo(40)
            make.right.equalTo(-40)
        }
        endingColView.snp.makeConstraints { (make) in
            make.top.equalTo(endingLabel.snp.bottom).offset(spasingBetvinViews)
            make.left.right.equalTo(containerView)
            make.height.equalTo(heihtOfScrollView)
        }


        
    }
    
    



}

