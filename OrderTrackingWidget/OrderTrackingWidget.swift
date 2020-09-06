//
//  OrderTrackingWidget.swift
//  OrderTrackingWidget
//
//  Created by kbedi on 13/07/2020.
//

import WidgetKit
import SwiftUI

struct OrderStatusEntry: TimelineEntry, Codable {
    var date = Date()
    var model: OrderTrackingWidgetModel
}

struct Provider: TimelineProvider {
    typealias Entry = OrderStatusEntry
    
    @AppStorage("orderStatus", store: UserDefaults(suiteName: "group.bedi.WidgetDemo"))
    var orderData: Data = Data()
    
    func placeholder(in context: Context) -> OrderStatusEntry {
        let model = try! JSONDecoder().decode(OrderTrackingWidgetModel.self, from: orderData)
        return OrderStatusEntry(model: model)
    }

    func getSnapshot(in context: Context, completion: @escaping (OrderStatusEntry) -> Void) {
        guard let model = try? JSONDecoder().decode(OrderTrackingWidgetModel.self, from: orderData) else { return }
        let entry = OrderStatusEntry(model: model)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<OrderStatusEntry>) -> Void) {
        guard let model = try? JSONDecoder().decode(OrderTrackingWidgetModel.self, from: orderData) else { return }
        let entry = OrderStatusEntry(model: model)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct OrderTrackingWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {        
        OrderTrackingView(orderStatus: entry)
    }
}

@main
struct OrderTrackingWidget: Widget {
    private let kind: String = "OrderTrackingWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            OrderTrackingWidgetEntryView(entry: entry)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(ContainerRelativeShape().fill(gradientColor))
        }
        .configurationDisplayName("MAF Order Tracking Widget")
        .description("Use this widget to keep a track of your orders & get real time updates!")
        .supportedFamilies([.systemSmall])
    }
    
    private var gradientColor: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Colors.mafBlueStartColor, Colors.mafBlueEndColor]), startPoint: .top, endPoint: .bottom)
    }
}
