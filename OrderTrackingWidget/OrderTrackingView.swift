//
//  OrderTrackingView.swift
//  OrderTrackingWidgetExtension
//
//  Created by kbedi on 13/07/2020.
//

import SwiftUI
import WidgetKit

struct OrderView: View {
    let date: String
    let number: String
    let total: String
    
    var body: some View {
        VStack {
            Text("Order Number").foregroundColor(.gray).font(.system(size: 14))
            Text(number).font(.system(size: 12))
            Spacer()
            Text("Order Date").foregroundColor(.gray).font(.system(size: 14))
            Text(date).font(.system(size: 12))
            Spacer()
            Text("Order Total").foregroundColor(.gray).font(.system(size: 14))
            Text(total).font(.system(size: 12))
        }
        .padding(.all, 10)
    }
}




struct CircleView: View {
    
    let text: String
    let imageName: String
    let backgroundColor: Color
    var shouldScale = true
        
    var body: some View {
        VStack(alignment: .center) {
            
            Image(imageName)
                .scaleEffect(x: shouldScale ? 1.5 : 1.0, y: shouldScale ? 1.5 : 1.0, anchor: .center)
            Text("")
            Text(text)
                .fontWeight(.medium)
                .font(.system(size: 12))
        }
        .padding(.all, 20)
        .background(backgroundColor.opacity(0.2))
        .cornerRadius(10.0)
        .clipShape(Circle())
    }
}


struct OrderTrackingSmallView: View {
    let orderStatus: OrderStatusEntry
     
    var model:OrderTrackingWidgetModel {
        return orderStatus.model
    }
    
    var body: some View {
        CircleView(text: model.status, imageName: model.imageName, backgroundColor: Color(hex: model.color))
    }
}

struct OrderTrackingMediumView: View {
    let orderStatus: OrderStatusEntry
    
    var model:OrderTrackingWidgetModel {
        return orderStatus.model
    }
    var body: some View {
        HStack(spacing: 10) {
            CircleView(text: model.status, imageName: model.imageName, backgroundColor: Color(hex: model.color))
            OrderView(date: model.date, number: model.number, total: model.total)
        }
        .padding(.all, 10)
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
