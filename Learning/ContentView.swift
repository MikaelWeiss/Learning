//
//  ContentView.swift
//  Learning
//
//  Created by Mikael Weiss on 3/4/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            let viewWidth: CGFloat = 332
            let scaleFactor = geo.size.width / viewWidth
            Color.blue
                .frame(width: viewWidth, height: 212)
                .scaleEffect(scaleFactor, anchor: .center)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 450, height: 400)
            .previewLayout(.sizeThatFits)
        ContentView()
            .frame(width: 364, height: 400)
            .previewLayout(.sizeThatFits)
        ContentView()
            .frame(width: 200, height: 400)
            .previewLayout(.sizeThatFits)
    }
}
