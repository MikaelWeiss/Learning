//
//  ContentView.swift
//  Learning
//
//  Created by Mikael Weiss on 3/4/21.
//

import SwiftUI

struct ContentView: View {
    
    private let originalWidth: CGFloat = 332
    private let originalHeight: CGFloat = 212
    
    var body: some View {
        VStack(spacing: 0) {
            Circle()
            Color.blue
                .widthScaled(originalWidth: originalWidth, originalHeight: originalHeight)
                .border(Color.red, width: 5)
            Circle()
        }
    }
}

extension View {
    func widthScaled(originalWidth: CGFloat, originalHeight: CGFloat) -> some View {
        modifier(WidthScaled(originalWidth: originalWidth, originalHeight: originalHeight))
    }
}

struct WidthScaled: ViewModifier {
    let originalWidth: CGFloat
    let originalHeight: CGFloat
    @State var frame: CGSize
    private var scaleFactor: CGFloat {
        frame.width / originalWidth
    }
    
    init(originalWidth: CGFloat, originalHeight: CGFloat) {
        self.originalWidth = originalWidth
        self.originalHeight = originalHeight
        self.frame = CGSize(width: originalWidth, height: originalHeight)
    }
    
    func body(content: Content) -> some View {
        GeometryReader { geo in
            makeView(geo, content: content)
        }
            .frame(height: originalHeight * scaleFactor)
    }
    
    private func makeView(_ geo: GeometryProxy, content: Content) -> some View {
        print(geo.size.width, geo.size.height)

        DispatchQueue.main.async { self.frame = geo.size }
        
        return content
            .frame(width: originalWidth, height: originalHeight)
            .scaleEffect(geo.size.width / originalWidth, anchor: .leading)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
