//
//  ImageAndTextView.swift
//  OrderTrackingWidgetExtension
//
//  Created by kbedi on 15/07/2020.
//

import SwiftUI

struct ImageAndTextView: View {
    enum LabelDirection {
        case right, down
    }
    
    let labelDirection: LabelDirection
    let text: String
    let textColor: String
    let imageName: String
    
    var body: some View {
        
        switch labelDirection {
        case .right:
            
            HStack(alignment: .center, spacing: 10) {
                Image(imageName)
                Text(text)
                    .bold()
                    .font(.system(size: 10))
                    .foregroundColor(Color(hex: textColor))
            }

        case .down:
            VStack(alignment: .center, spacing: 6) {
                Image(imageName)
                Text(text)
                    .bold()
                    .font(.system(size: 10))
                    .foregroundColor(Color(hex: textColor))
            }
        }
    }
}
