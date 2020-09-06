//
//  OrderTrackingWidgetModel.swift
//  WidgetDemo
//
//  Created by kbedi on 13/07/2020.
//

import Foundation

struct OrderTrackingWidgetModel: Identifiable, Codable {
    let number: String
    let date: String
    let total: String
    let status: String
    let color: String
    let imageName: String
    
    
    var id: String { number }
}
