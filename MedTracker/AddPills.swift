//
//  AddPills.swift
//  MedTracker
//
//  Created by Roman on 21.07.2020.
//  Copyright © 2020 MacBook Air. All rights reserved.
//

import UIKit
import SnapKit
import Eureka
class AddPills: UIViewController {
    lazy var nameTE:UITextField = {
        let text = UITextField()
        text.font = UIFont(name: "AmericanTypewriter-Bold", size: 30)
        text.sizeToFit()
        text.placeholder = "Введите название"
        return text
    }()
    lazy var pillImage:UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return button
    }()
    
    lazy var packageImage:UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return button
    }()
    
    lazy var imageStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 60
        view.distribution = .fill
        view.alignment = .fill
        return view
        
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameTE)
        view.addSubview(imageStack)
        imageStack.addArrangedSubview(pillImage)
        imageStack.addArrangedSubview(packageImage)
        packageImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
        }
        pillImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
        }
        imageStack.snp.makeConstraints { (make) in
            make.top.equalTo(nameTE.snp.bottom).offset(30)
            make.centerX.equalTo(view)
            make.height.equalTo(100)
        }
        
       

        nameTE.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(35)
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).offset(40)
            
        }
        

        
        
        

        



    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    



}
