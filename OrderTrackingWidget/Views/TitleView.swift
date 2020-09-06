//
//  TitleView.swift
//  OrderTrackingWidgetExtension
//
//  Created by kbedi on 06/09/2020.
//

import SwiftUI

struct TitleView: View {
    
    let title: String
    let subTitle: String

    var body: some View {
        HStack(spacing: 4) {
            Text(title).foregroundColor(.white).font(.system(size: 18)).bold()
            Text(subTitle).foregroundColor(.white).font(.system(size: 10))
        }
    }
}
