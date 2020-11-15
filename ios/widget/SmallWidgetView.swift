//
//  SmallWidgetView.swift
//  Runner
//
//  Created by Hansen Liang on 11/9/20.
//

import SwiftUI

struct SmallWidgetView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView()
            .previewLayout(.fixed(width: 160, height: 160))
    }
}
