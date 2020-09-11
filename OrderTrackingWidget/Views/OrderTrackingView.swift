//
//  OrderTrackingView.swift
//  OrderTrackingWidgetExtension
//
//  Created by kbedi on 13/07/2020.
//

import SwiftUI
import WidgetKit

struct OrderTrackingView: View {
    
    let orderStatus: OrderStatusEntry
    
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        
        switch family {
        case .systemSmall:  SmallView(orderStatus: orderStatus)
        case .systemMedium: MediumView(orderStatus: orderStatus)            
        default: SmallView(orderStatus: orderStatus)
        }
    }
}



//MARK: - Small View -
private struct SmallView: View {
    let orderStatus: OrderStatusEntry
    
    private var model:OrderTrackingWidgetModel {
        return orderStatus.model
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            LogoView(title: "#Shipment 1")
            OrderInfoView(date: model.date, number: model.number, total: model.total, isSingleProduct: false)
            DeliveryStatusView(imageName: model.imageName, deliveryStatus: "#Delivered", deliveryTime: "#15 Aug (12pm - 2pm)")
        }
//        .padding(EdgeInsets(top: 12, leading: 10, bottom: 12, trailing: 12))
    }
}

//MARK: - Medium View -
private struct MediumView: View {
    let orderStatus: OrderStatusEntry
    
    private var model:OrderTrackingWidgetModel {
        return orderStatus.model
    }
    var body: some View {
            VStack(alignment: .leading) {
                LogoView(title: "#Medium Title")
                OrderInfoView(date: model.date, number: model.number, total: model.total, isSingleProduct: true)     
                ImageAndTextView(labelDirection: .down,
                                 text: model.status,
                                 textColor: model.color,
                                 imageName: model.imageName)
            }
    }
}
