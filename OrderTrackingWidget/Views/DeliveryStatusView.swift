//
//  DeliveryStatusView.swift
//  OrderTrackingWidgetExtension
//
//  Created by kbedi on 11/09/2020.
//

import Foundation

import SwiftUI

struct DeliveryStatusView: View {
//    let text: String
//    let textColor: String
    let imageName: String
    let deliveryStatus: String
    let deliveryTime: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(imageName)
            VStack(alignment: .leading) {
                Text(deliveryStatus)
                    .font(.system(size: 8))
                Text(deliveryTime)
                    .bold()
                    .font(.system(size: 8))
            }
            .foregroundColor(.white)
        }
    }
}
