//
//  Pill.swift
//  MedTracker
//
//  Created by Roman on 21.07.2020.
//  Copyright © 2020 MacBook Air. All rights reserved.
//

import Foundation


final class Pill:Decodable {
    var id:Int
    var pillName: String
    var startDate: Date
    var duration: Date
    var doza: Double
    var unit: String
    var shedule: [Date]
    var history: [Date:Bool]
    var pillImage:String
    var pakageImage:String
    
    init(id:Int,pillName: String,startDate: Date,  duration: Date,  doza:Double, unit: String, shedule: [Date], history : [Date:Bool], pillImage: String, pakageImage :String) {
        self.id = id
        self.pillName = pillName
        self.startDate = startDate
        self.duration = duration
        self.doza = doza
        self.unit = unit
        self.shedule = shedule
        self.history = history
        self.pillImage = pillImage
        self.pakageImage = pakageImage
    }
    
}


