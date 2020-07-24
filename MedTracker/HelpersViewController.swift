//
//  HelpersViewController.swift
//  MedTracker
//
//  Created by MacBook Air on 18.07.2020.
//  Copyright © 2020 MacBook Air. All rights reserved.
//

import Foundation
import Eureka
import Charts
import ViewRow
import SwiftChart
import HealthKit



class HelpersViewController: FormViewController, ChartViewDelegate {

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
                $0.value = UserDefaults.standard.value(forKey: "weight") as? Int
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
            <<< DecimalRow() {
                $0.title = "Текущий вес"
                $0.value = UserDefaults.standard.value(forKey: "weight") as? Double
            }

                       <<< ViewRow<Chart>("graph") { (row) in
                           row.title = "График изменения веса"
                       }
                       .cellSetup { (cell, row) in
                           cell.view = Chart(frame: CGRect(x: 0, y: 0, width: 100, height: UIDevice.current.userInterfaceIdiom == .pad ? 300 : 210))
                           
                           cell.viewLeftMargin = 5.0
                           cell.viewRightMargin = 5.0
                           
                           let sampleCount = data.count
                           let msPerSample = 3.90625
                           let intervalSamples = 200.0 /* ms */ / Double(msPerSample)
                           let baseLine = 51
                          
                          let series = ChartSeries(data.compactMap({ (v) in return Double(v) }))
                           let min = floor(data.min()!)
                           let max = ceil(data.max()!)
                           
                           var xLabelValues : [Double] = []
                           
                           for i in 0...Int(Double(sampleCount) / intervalSamples) {
                               xLabelValues.append(Double(Int(Double(i) * intervalSamples)))
                           }
                           
                        
                        
                           cell.view!.xLabels = xLabelValues
                           cell.view!.xLabelsFormatter = {
                               let fMsPerSample = Double(msPerSample)
                               let fBaseLine = Double(baseLine)
                               
                               return "\(Int($1 * fMsPerSample - fBaseLine * fMsPerSample + ($1 < fBaseLine ? -9.9 : 9.9)) / 10 * 10)г"
                           }
                           cell.view!.yLabels = [min, max]
                           cell.view!.yLabelsFormatter = { return "\(Int($1))кг" }
                           
                           series.area = true
                        
                        series.colors = (
                          above: ChartColors.redColor(),
                          below: ChartColors.cyanColor(),
                          zeroLevel:UserDefaults.standard.value(forKey: "dreamWeight") as! Double
                        )
                           cell.view!.add(series)
                       }
    }
}

let data = [58,
            60,
            59,
            58,
            57,
            57.5,
            55,
            60
]

