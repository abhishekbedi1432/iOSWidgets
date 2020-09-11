//
//  LogoView().swift
//  OrderTrackingWidgetExtension
//
//  Created by kbedi on 13/07/2020.
//

import SwiftUI

struct LogoView: View {
    let title: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image("c4_logo_small").resizable().frame(width: 32.0, height: 32.0)
            Text(title)
                .bold()
                .font(.system(size: 12))
        }
        .foregroundColor(.white)
        
    }
}
