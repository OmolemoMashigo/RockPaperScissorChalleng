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
    @State private var mustWin = Bool.random()
    @State private var score = 0
    @State private var questionCount = 0
    @State private var gameOverAlert = true
    
    var body: some View {
        VStack(spacing: 30) {
            Text("score: \(score)")
                .font(.title)
            
            Text(moves[appChoice])
                .font(.system(size: 50))
            
            Text(mustWin ? "WIN": "LOSE")
                .font(.title2)
                .foregroundColor(mustWin ? .green : .red)
            
            HStack(spacing: 20){
                ForEach(0..<3){ index in
                    Button(moves[index]){
                        moveTapped(index)
                    }
                }
            }
        }
        
        .alert("Game Over", isPresented: $gameOverAlert){
            Button("Continue"){
                score = 0
                reset()
            }
            
        } message: {
            Text("your final score is \(score)")
            
        }
    }
    
    func moveTapped(_ moveIndex: Int){
       
        let correctMoveIndex: Int
                
                if mustWin {
                    correctMoveIndex = (appChoice + 1) % 3
                } else {
                    correctMoveIndex = (appChoice + 2) % 3
                }
                
                if moveIndex == correctMoveIndex {
                    score += 1
                } else {
                    score -= 1
                }
                
                questionCount += 1
                
                if questionCount == 10 {
                    gameOverAlert = true
                } else {
                    appChoice = Int.random(in: 0...2)
                    mustWin.toggle()
                }
    }
    
    func reset(){
        appChoice = Int.random(in: 0...2)
        mustWin = Bool.random()
        score = 0
        questionCount = 0
    }
}

#Preview {
    ContentView()
}
