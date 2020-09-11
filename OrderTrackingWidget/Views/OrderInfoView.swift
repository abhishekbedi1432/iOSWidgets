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
    let isSingleProduct: Bool
    
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        
        switch family {
        case .systemSmall:
            SmallView(date: date, number: number, total: total, isSingleProduct: isSingleProduct)
            
        case .systemMedium:
            MediumView(date: date, number: number, total: total)
            
        default: SmallView(date: date, number: number, total: total, isSingleProduct: isSingleProduct)
        }
    }
}

//MARK: - Small View -
private struct SmallView: View {
    let date: String
    let number: String
    let total: String
    let isSingleProduct: Bool
    
    @Environment(\.imageCache) var cache: ImageCache
   
    @ViewBuilder
    var body: some View {
        
        if isSingleProduct {
            singleProductView
        } else {
            multiProductView
        }
    }
    
    
    fileprivate var singleProductView: some View {
        HStack(alignment: .center) {
            Text("#Panasonic Microwave").font(.system(size: 10)).lineLimit(3)
            AsyncImage(
               url: URL(string: "https://via.placeholder.com/150/92c952")!,
               cache: self.cache,
                placeholder: Text("Loading ...").font(.system(size: 10)),
               configuration: { $0.resizable() }
            )
            .frame(minWidth: 48, maxWidth: 48, minHeight: 48, maxHeight: 48)
        }
        .foregroundColor(.white)
    }
    
    
    
    fileprivate var multiProductView: some View {
        VStack(alignment: .leading) {
            TitleView(title: "15", subTitle: "items (Groceries)")
            
            HStack {
                AsyncImage(
                   url: URL(string: "https://via.placeholder.com/150/92c952")!,
                   cache: self.cache,
                   placeholder: Text("Loading ..."),
                   configuration: { $0.resizable() }
                )
                .frame(minWidth: 25, maxWidth: 25, minHeight: 25, maxHeight: 25)

                AsyncImage(
                   url: URL(string: "https://via.placeholder.com/150/92c952")!,
                   cache: self.cache,
                   placeholder: Text("Loading ..."),
                   configuration: { $0.resizable() }
                )
                .frame(minWidth: 25, maxWidth: 25, minHeight: 25, maxHeight: 25)

                AsyncImage(
                   url: URL(string: "https://via.placeholder.com/150/92c952")!,
                   cache: self.cache,
                   placeholder: Text("Loading ..."),
                   configuration: { $0.resizable() }
                )
                .frame(minWidth: 25, maxWidth: 25, minHeight: 25, maxHeight: 25)
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
