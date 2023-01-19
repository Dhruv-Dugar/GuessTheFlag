//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Dhurv Dugar on 13/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore : Bool = false
    @State private var scoreTitle : String = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    
    
    var body: some View{
        ZStack{
            
//            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .top, startRadius: 20, endRadius: 200).ignoresSafeArea()
            
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                }
                
                
                ForEach(0..<3) { number in
                    Button{
                        flagTapped(number: number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
            }
        }.alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestions)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(number: Int){
        if number == correctAnswer{
                scoreTitle = "Correct"
        }
        else{
            scoreTitle = "Wrong!"
        }
        showingScore = true
    }
    
    
    func askQuestions(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

