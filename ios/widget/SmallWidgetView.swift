//
//  SmallWidgetView.swift
//  Runner
//
//  Created by Hansen Liang on 11/9/20.
//

import SwiftUI

struct SmallWidgetView: View {
    var body: some View {
        ZStack{
            Color.WidgetBackgroundColor
            HStack{
                VStack(alignment: .leading){
                    Text("Revenue")
                        .font(.headline)
                        .foregroundColor(.HeadlineTextColor)
                    Text("from nka")
                        .font(.caption)
                        .foregroundColor(.CaptionTextColor)
                    Spacer()
                    Text("$24.5k")
                        .font(.title)
                        .foregroundColor(.HeadlineTextColor)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView()
            .preferredColorScheme(.light)
            .previewLayout(.fixed(width: 160, height: 160))
    }
}
