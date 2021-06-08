//
//  ContentView.swift
//  Learning
//
//  Created by Mikael Weiss on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    let val = Decimal(4)
    var body: some View {
        Text("**Name:** \(val.formatted())")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
