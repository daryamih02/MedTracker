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
            
            <<< DecimalRow() {
                $0.title = "Ваш вес"
                //$0.value = 5дефолт
                $0.formatter = DecimalFormatter()
                $0.useFormatterDuringInput = true
                //$0.useFormatterOnDidBeginEditing = true
                }.cellSetup { cell, _  in
                    cell.textField.keyboardType = .numberPad
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
             <<< DateRow() { $0.value = Date(); $0.title = "С" }
            
             <<< DateRow() { $0.value = Date(); $0.title = "По" }


            +++ Section("Дневник веса"){
                $0.tag = "weight_s"
                $0.hidden = "$segments != 'Дневник веса'"
            }
            <<< DecimalRow() {
                $0.title = "Текущий вес"
                //$0.value = 5//дефолт
                $0.formatter = DecimalFormatter()
                $0.useFormatterDuringInput = true
                //$0.useFormatterOnDidBeginEditing = true
                }.cellSetup { cell, _  in
                    cell.textField.keyboardType = .numberPad
            }

            <<< DecimalRow() {
                $0.title = "Желаемый вес"
                //$0.value = 5//дефолт
                $0.formatter = DecimalFormatter()
                $0.useFormatterDuringInput = true
                //$0.useFormatterOnDidBeginEditing = true
                }.cellSetup { cell, _  in
                    cell.textField.keyboardType = .numberPad
            }
        
        
    }
    
}
