//
//  TransitionStuff.swift
//  Learning
//
//  Created by Mikael Weiss on 7/26/21.
//

import SwiftUI

struct MyScaleModifier: ViewModifier {
    let isCard: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(
                maxWidth: isCard ? 300 : .infinity,
                maxHeight: isCard ? 350 : .infinity)
            .clipShape(RoundedRectangle(
                cornerRadius: isCard ? 36 : 0,
                style: .continuous))
            .animation(.easeIn(duration: 1), value: isCard)
    }
}

extension AnyTransition {
    static var myScale: AnyTransition {
        let insertion = AnyTransition.modifier(
            active: MyScaleModifier(isCard: true),
            identity: MyScaleModifier(isCard: false))
        return AnyTransition.asymmetric(insertion: insertion, removal: .opacity)
    }
}

struct TransitionStuff: View {
    @State private var condition = false
    
    var body: some View {
        VStack {
            if condition {
                Text("Hello, World!")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.pink)
                    .transition(.myScale)
            }
            Button("Yeet") {
                withAnimation {
                    condition.toggle()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

struct TransitionStuff_Previews: PreviewProvider {
    static var previews: some View {
        TransitionStuff()
    }
}
