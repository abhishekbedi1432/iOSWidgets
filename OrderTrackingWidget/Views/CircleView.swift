//
//  CircleView.swift
//  OrderTrackingWidgetExtension
//
//  Created by kbedi on 13/07/2020.
//

import SwiftUI
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

//struct CircleView_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleView(text: "Delivered", imageName: "person.account", backgroundColor: Color(.green))
//    }
//}
