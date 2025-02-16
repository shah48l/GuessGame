//
//  ContentView.swift
//  GuessGame
//
// This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
//
//Copyright (c) 2024 Fullstacktuts LLC


import SwiftUI

struct ContentView: View {
    
    @State var correctAnswer = 0
    @State var score = 0
    @State var gameTitle = "?"
    @State var gameSubtitle = ""
    
    var body: some View {
        VStack {
            Text(gameTitle)
                .font(.system(size: 40, weight: .semibold))
                .padding(.top, 100)
            Text(gameSubtitle)
                .font(.system(size: 20, weight: .semibold))
                .padding(.bottom, 100)
            HStack{
                Spacer()
                Text("Score \(score)")
                    .font(.system(size: 15,weight: .semibold))
            }
            Button(action: {
                check(answer: 0)
            }, label: {
                Image("dog")
                    .frame(maxWidth : .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            })
            Button(action: {
                check(answer: 1)
            }, label: {
                Image("cat")
                    .frame(maxWidth : .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            })
            Button(action: {
                check(answer: 2)
            }, label: {
                Image("fox")
                    .frame(maxWidth : .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            })
            Spacer()
        }
        .padding()
    }
    func check(answer:Int){
        if answer == correctAnswer{
            score += 1
            gameTitle = "Success"
        }else{
            if score != 0 {
                score -= 1
            }
            gameTitle = "Failed!"
        }
        if correctAnswer == 0 {
            gameSubtitle = "Correct answer is dog"
        }
        else if correctAnswer == 1{
            gameSubtitle = "Correct answer is cat"
        }else if correctAnswer == 2{
            gameSubtitle = "Correct answer is fox"
        }
        randomizeCorrectAnswer()
        
    }
    func randomizeCorrectAnswer(){
        let randomizeCorrectAnswer =  Int.random(in: 0..<3)
        correctAnswer = randomizeCorrectAnswer
    }
}

#Preview {
    ContentView()
}
