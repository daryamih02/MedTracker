//
//  HelpersViewController.swift
//  MedTracker
//
//  Created by MacBook Air on 18.07.2020.
//  Copyright © 2020 MacBook Air. All rights reserved.
//

import Foundation
import Eureka

class HelpersViewController: FormViewController {

override func viewDidLoad() {
    super.viewDidLoad()
    createForm()
    self.navigationItem.title = "Помощники"
}
    
    func createForm() {
    TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 12)
        }

        form = Section("Выберите помощника")
            <<< SegmentedRow<String>("segments"){
                $0.options = ["Калькулятор", "Планировщик", "Дневник веса"]
                $0.value = "Калькулятор"
            }
            +++ Section("Калькулятор"){
                $0.tag = "calc_s"
                $0.hidden = "$segments != 'Калькулятор'" // .Predicate(NSPredicate(format: "$segments != 'Калькулятор'"))
            }
            
            <<< IntRow() {
                $0.title = "Ваш вес"
                $0.value = 56
            }
            
            <<< PushRow<String>() {
                $0.title = "Лекарство"
                $0.options = ["Аскорбинка", "Витаминка"]//Список лекарств юзера
                //$0.value = //дефолтное значение
                $0.selectorTitle = "Выберите лекарство!"
                }.onPresent { from, to in
                    to.dismissOnSelection = false
                    to.dismissOnChange = false
            }

            +++ Section("Планировщик"){
                $0.tag = "plan_s"
                $0.hidden = "$segments != 'Планировщик'"
            }
             <<< DateRow("dateFrom") { $0.value = Date(); $0.title = "С" }
            
            <<< DateRow("dateTo") {
                $0.title = "По"
                
            }
            

            <<< LabelRow("label") {
                
                $0.value = "1212121"
                $0.hidden = .function(["dateTo"], { form -> Bool in
                    let row : DateRow = form.rowBy(tag: "dateTo") as! DateRow
                    if row.value == nil {
                        return true
                    } else {
                        return false
                    }
                    
                })
            }


            +++ Section("Дневник веса"){
                $0.tag = "weight_s"
                $0.hidden = "$segments != 'Дневник веса'"
            }
            <<< IntRow() {
                $0.title = "Текущий вес"
                $0.value = 56
            }
    }
    
}
