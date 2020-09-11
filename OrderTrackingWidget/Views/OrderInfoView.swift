//
//  OrderInfoView.swift
//  OrderTrackingWidgetExtension
//
//  Created by kbedi on 13/07/2020.
//

import SwiftUI
import WidgetKit

struct OrderInfoView: View {
    let date: String
    let number: String
    let total: String
    
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        
        switch family {
        case .systemSmall:
            SmallView(date: date, number: number, total: total)
            
        case .systemMedium:
            MediumView(date: date, number: number, total: total)
            
        default: SmallView(date: date, number: number, total: total)
        }
    }
}

//MARK: - Small View -
private struct SmallView: View {
    let date: String
    let number: String
    let total: String
    
    @Environment(\.imageCache) var cache: ImageCache
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleView(title: "15", subTitle: "items (Groceries)")
            
            HStack {
                AsyncImage(
                   url: URL(string: "https://via.placeholder.com/150/92c952")!,
                   cache: self.cache,
                   placeholder: Text("Loading ..."),
                   configuration: { $0.resizable() }
                )
                .frame(minWidth: 32, maxWidth: 32, minHeight: 32, maxHeight: 32)

                AsyncImage(
                   url: URL(string: "https://via.placeholder.com/150/92c952")!,
                   cache: self.cache,
                   placeholder: Text("Loading ..."),
                   configuration: { $0.resizable() }
                )
                .frame(minWidth: 32, maxWidth: 32, minHeight: 32, maxHeight: 32)

                AsyncImage(
                   url: URL(string: "https://via.placeholder.com/150/92c952")!,
                   cache: self.cache,
                   placeholder: Text("Loading ..."),
                   configuration: { $0.resizable() }
                )
                .frame(minWidth: 32, maxWidth: 32, minHeight: 32, maxHeight: 32)
            }
        }
    }
}

//MARK: - Medium View -
private struct MediumView: View {
    let date: String
    let number: String
    let total: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 50) {
            TitleSubtitleView(title: "Order Number", subTitle: number)
            TitleSubtitleView(title: "Order Date", subTitle: date)
            TitleSubtitleView(title: "Total AED", subTitle: total)
        }
        .frame(width: 280)
        .offset(x: -5)
    }
}
