//
//  TitleSubtitleView.swift
//  OrderTrackingWidgetExtension
//
//  Created by kbedi on 13/07/2020.
//

import SwiftUI

struct TitleSubtitleView: View {
    
    let title: String
    let subTitle: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title).foregroundColor(Colors.black).font(.system(size: 10))
            Text(subTitle).font(.system(size: 10)).bold()
        }
    }
}
