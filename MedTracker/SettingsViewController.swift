//
//  SettingsViewController.swift
//  MedTracker
//
//  Created by MacBook Air on 18.07.2020.
//  Copyright © 2020 MacBook Air. All rights reserved.
//

import Foundation
import Eureka

class SettingsViewController: FormViewController {

override func viewDidLoad() {
    super.viewDidLoad()
    createForm()
}

func createForm() {
    form +++
        
    Section("Единицы измерения")
    
    <<< PushRow<String>() {
        $0.title = "Вес"
        $0.options = ["Килограммы", "Фунты"]
        $0.value = "КИлограммы"
        $0.selectorTitle = "Выберите единицу измерения веса!"
        }.onPresent { from, to in
            to.dismissOnSelection = false
            to.dismissOnChange = false
    }

    
}
    
}
