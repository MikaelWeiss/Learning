//
//  ContentView.swift
//  Learning
//
//  Created by Mikael Weiss on 3/4/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(0..<5) { _ in
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.blue)
                        .frame(width: 300, height: 56)
                        .delaysTouches()
                }
            }
        }
    }
}

struct StandardScrollableButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .animation(.default.delay(0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
    /// Fixes issue where drag gesture would overide scroll view
    /// See [here](https://www.hackingwithswift.com/forums/swiftui/a-guide-to-delaying-gestures-in-scrollview/6005)
    func delaysTouches(for duration: TimeInterval = 1, onTap action: @escaping () -> Void = {}) -> some View {
        modifier(DelaysTouches(duration: duration, action: action))
    }
}

private struct DelaysTouches: ViewModifier {
    @State private var disabled = false
    
    var duration: TimeInterval
    var action: () -> Void
    
    func body(content: Content) -> some View {
        Button(action: action) { content }
            .buttonStyle(DelaysTouchesButtonStyle(disabled: $disabled, duration: duration))
            .disabled(disabled)
    }
}

private struct DelaysTouchesButtonStyle: ButtonStyle {
    @State private var touchDownDate: Date?
    @Binding var disabled: Bool
    var duration: TimeInterval
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .onChange(of: configuration.isPressed, perform: handleIsPressed)
            .opacity(configuration.isPressed ? 0.1 : 1.0)
    }
    
    private func handleIsPressed(isPressed: Bool) {
        if isPressed {
            let date = Date()
            touchDownDate = date
            
            DispatchQueue.main.asyncAfter(deadline: .now() + max(duration, 0)) {
                if date == touchDownDate {
                    disabled = true
                    
                    DispatchQueue.main.async {
                        disabled = false
                    }
                }
            }
        } else {
            touchDownDate = nil
            disabled = false
        }
    }
}
