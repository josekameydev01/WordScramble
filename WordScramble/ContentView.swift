//
//  ContentView.swift
//  WordScramble
//
//  Created by carlosgalvankamey on 9/7/25.
//

import SwiftUI

struct ContentView: View {
    private let users = ["Carlos", "Cracklitos", "Carlitos"]
    var body: some View {
        List(users, id: \.self) {
            Text($0)
        }
    }
}

#Preview {
    ContentView()
}
