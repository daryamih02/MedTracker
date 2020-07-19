//
//  UserProfileViewController.swift
//  MedTracker
//
//  Created by MacBook Air on 16.07.2020.
//  Copyright © 2020 MacBook Air. All rights reserved.
//

import UIKit
import Eureka

class UserProfileViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createForm()
        self.navigationItem.title = "Профиль"
    }
    
    func createForm() {
        form +++

                   Section("Данные профиля")

                  <<< TextRow() {
                      $0.title = "Имя"
                      $0.value = "John Doe"
                  }

                  <<< TextRow() {
                      $0.title = "Ник"
                      $0.value = "johndoe1"
                  }

                  <<< EmailRow() {
                      $0.title = "Email Address"
                      $0.value = "john@doe.com"
                  }

                  <<< PasswordRow() {
                      $0.title = "Пароль"
                      $0.value = "johndoe9876"
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
                
            
                <<< DecimalRow() {
                    $0.title = "Ваш рост"
                    //$0.value = 5дефолт
                    $0.formatter = DecimalFormatter()
                    $0.useFormatterDuringInput = true
                    //$0.useFormatterOnDidBeginEditing = true
                    }.cellSetup { cell, _  in
                        cell.textField.keyboardType = .numberPad
                }
            
               <<< PickerInputRow<String>("Пол"){
                   $0.title = "Пол"
                   $0.options = ["Женщина", "Мужчина"]
                   $0.value = $0.options.first
               }
            
            <<< ButtonRow("Настройки") { row in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "SettingsViewController", onDismiss:{  vc in vc.dismiss(animated: true) })
            }
        
            +++
            MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
                               header: "Заболевания") {
                                $0.tag = "textfields"
                                $0.addButtonProvider = { section in
                                    return ButtonRow(){
                                        $0.title = "Добавить новое значение"
                                        }.cellUpdate { cell, row in
                                            cell.textLabel?.textAlignment = .left
                                    }
                                }
                                $0.multivaluedRowToInsertAt = { index in
                                    return NameRow() {
                                        $0.placeholder = "Опишите заболевание"
                                    }
                                }
                                $0 <<< NameRow() {
                                    $0.placeholder = "Опишите заболевание"
                                }
                }
        
            
}
    
}


