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
        Text(orderStatus.status)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
//            .clipShape(Circle())
    }
}

struct OrderTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        let order = OrderStatusEntry.init(status: "#Status", date: Date())
        return OrderTrackingView.init(orderStatus: order)
    }
}
