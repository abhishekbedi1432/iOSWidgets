//
//  OrderTrackingView.swift
//  OrderTrackingWidgetExtension
//
//  Created by kbedi on 13/07/2020.
//

import SwiftUI

struct OrderTrackingView: View {
    
    let orderStatus: OrderStatusEntry
    
    var body: some View {
        
        if orderStatus.status == "In-Progress" {
            Text(orderStatus.status)
                .font(.subheadline)
                .padding()
                .background(Color.orange)
        }
        else if orderStatus.status == "Delivered" {
            Text(orderStatus.status)
                .font(.subheadline)
                .padding()
                .background(Color.green)

        }
        else {
            Text(orderStatus.status)
                .font(.subheadline)
                .padding()
                .background(Color.red)
        }
    }
}

struct OrderTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        let order = OrderStatusEntry.init(status: "#Status", date: Date())
        return OrderTrackingView.init(orderStatus: order)
    }
}
