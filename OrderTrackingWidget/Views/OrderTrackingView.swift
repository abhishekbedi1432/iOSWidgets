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
            LogoView()
            OrderInfoView(date: model.date, number: model.number, total: model.total)
            Spacer()
            ImageAndTextView(labelDirection: .right,
                             text: model.status,
                             textColor: model.color,
                             imageName: model.imageName)
        }
        .padding()
        .background(ContainerRelativeShape().fill(gradientColor))
    }
    
    private var gradientColor: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Colors.mafBlueStartColor, Colors.mafBlueEndColor]), startPoint: .top, endPoint: .bottom)
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
                LogoView()
                OrderInfoView(date: model.date, number: model.number, total: model.total)                    
                ImageAndTextView(labelDirection: .down,
                                 text: model.status,
                                 textColor: model.color,
                                 imageName: model.imageName)
            }
    }
}
