//
//  ContentView.swift
//  WordScramble
//
//  Created by carlosgalvankamey on 9/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var alertTitle = "Error"
    @State private var alertMessage = "The file cannot be found"
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Button("Show Message", action: showMessage)
                .buttonStyle(.borderedProminent)
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
    }
    private func showMessage() {
        showAlert = true
        guard let fileURL = Bundle.main.url(forResource: "file", withExtension: "txt") else {
            return
        }
        
        alertTitle = "file content"
        alertMessage = (try? String(contentsOf: fileURL, encoding: .utf8)) ?? "The file couldn't be read"
    }
}

#Preview {
    ContentView()
}
