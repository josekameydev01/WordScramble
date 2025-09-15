//
//  ContentView.swift
//  WordScramble
//
//  Created by carlosgalvankamey on 9/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
        }
    }
    private func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    private func startGame() {
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: ".txt") {
            if let fileContent = try? String(contentsOf: fileURL, encoding: .utf8) {
                let words = fileContent.components(separatedBy: "\n")
                rootWord = words.randomElement() ?? "aardvark"
                return
            }
    
        }
        fatalError("Could not load start.txt from bundle")
    }
    
}

#Preview {
    ContentView()
}
