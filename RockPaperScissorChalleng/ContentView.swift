//
//  ContentView.swift
//  RockPaperScissorChalleng
//
//  Created by Omolemo Mashigo on 2025/02/10.
//

import SwiftUI

struct ContentView: View {
    
    private let moves = ["Rock", "Paper", "Scissor"]
    
    @State private var appChoice = Int.random(in: 0...2)
    @State private var win = Bool.random()
    @State private var score = 0
    @State private var questionCount = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("score: \(score)")
                .font(.title)
            
            Text(moves[appChoice])
                .font(.system(size: 50))
            
            Text(win ? "WIN": "LOSE")
                .font(.title2)
                .foregroundColor(win ? .green : .red)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
