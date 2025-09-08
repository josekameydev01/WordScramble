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
            ForEach(0..<5) {
                Text("Row \($0)")
            }
        }
    }
}

#Preview {
    ContentView()
}
