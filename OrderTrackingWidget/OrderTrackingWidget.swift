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
    
    @AppStorage("orderStatus", store: UserDefaults(suiteName: "group.bedi.WidgetDemo"))
    var orderData: Data = Data()

    public func snapshot(with context: Context, completion: @escaping (OrderStatusEntry) -> ()) {
//        let entry = OrderStatusEntry(status: status, date: Date())
//        completion(entry)
        
        guard let model = try? JSONDecoder().decode(OrderTrackingWidgetModel.self, from: orderData) else { return }
        let entry = OrderStatusEntry.init(model: model)
        completion(entry)
        
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        /*
        var entries: [OrderStatusEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = OrderStatusEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
        */

        
        guard let model = try? JSONDecoder().decode(OrderTrackingWidgetModel.self, from: orderData) else { return }
        let entry = OrderStatusEntry(model: model)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
        
//        let entry = OrderStatusEntry(status: status, date: entryDate)
//        let timeline = Timeline(entries: [entry], policy: .atEnd)
//        completion(timeline)

    }
}


struct PlaceholderView : View {
    var body: some View {
        Text("#MAF Order Tracking Widget")
    }
}

struct OrderTrackingWidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family

    var body: some View {
        OrderTrackingView(orderStatus: entry, family: family)
    }
}

@main
struct OrderTrackingWidget: Widget {
    private let kind: String = "OrderTrackingWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            OrderTrackingWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
