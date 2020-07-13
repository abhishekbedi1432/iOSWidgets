//
//  OrderTrackingView.swift
//  OrderTrackingWidgetExtension
//
//  Created by kbedi on 13/07/2020.
//

import SwiftUI
import WidgetKit


struct OrderTrackingSmallView: View {
    let orderStatus: OrderStatusEntry
    
    var body: some View {
        Text(orderStatus.status)
    }
}

struct OrderTrackingMediumView: View {
    let orderStatus: OrderStatusEntry
    
    var body: some View {
        HStack(spacing: 30) {
            Text(orderStatus.status)
            Text(orderStatus.status)
        }
    }
}

struct OrderTrackingView: View {
    
    let orderStatus: OrderStatusEntry
    let family: WidgetFamily
    
    var body: some View {
        
        switch family {
        case .systemSmall:
            OrderTrackingSmallView(orderStatus: orderStatus)
            
        case .systemMedium:
            OrderTrackingMediumView(orderStatus: orderStatus)
            
        default: OrderTrackingSmallView(orderStatus: orderStatus)
        }
    }
}

struct OrderTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        let order = OrderStatusEntry.init(status: "#Status", date: Date())
        return OrderTrackingView.init(orderStatus: order, family: .systemSmall)
    }
}
