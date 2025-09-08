//
//  ContentView.swift
//  WordScramble
//
//  Created by carlosgalvankamey on 9/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Static row 1")
            Text("Static row 2")
            ForEach(0..<5) {
                Text("Dynamic row \($0)")
            }
        }
    }
}

#Preview {
    ContentView()
}
