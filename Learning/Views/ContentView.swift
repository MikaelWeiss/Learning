//
//  ContentView.swift
//  Learning
//
//  Created by Mikael Weiss on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingTabView = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 36, style: .continuous)
                .fill(Color.blue)
                .frame(maxWidth: 350, maxHeight: 300)
                .overlay(Text("Something").foregroundColor(.white))
                .onTapGesture {
                    withAnimation {
                        isShowingTabView.toggle()
                    }
                }
                .zIndex(1)
                .offset(x: 5, y: 400)
            VStack {
                TabsView()
                    .onTapGesture {
                        withAnimation {
                            isShowingTabView.toggle()
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: isShowingTabView ? 0 : 36, style: .continuous))
                    .frame(
                        maxWidth: isShowingTabView ? .infinity : 350,
                        maxHeight: isShowingTabView ? .infinity : 300)
                    .zIndex(isShowingTabView ? 1 : 0)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea()
        }
    }
}

struct TabsView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Color.red
                .tag(0)
                .ignoresSafeArea()
            Color.blue
                .tag(1)
                .overlay(Text("Something").foregroundColor(.white))
                .ignoresSafeArea()
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
