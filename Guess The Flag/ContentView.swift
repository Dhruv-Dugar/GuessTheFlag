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
        NavigationView{ZStack{
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            
            VStack{
                
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.black)
                            .font(.largeTitle.weight(.semibold))
                        
                        Text(countries[correctAnswer])
                            .foregroundColor(.black)
                            .font(.subheadline.weight(.heavy))
                    }
                    
                    
                    ForEach(0..<3) { number in
                        Button{
                            //                            flagTapped(number: number)
                        } label: {
                            VStack{
                                NavigationLink(destination: Maybe(), label: {
                                    VStack{
                                        Image(countries[number])
                                            .renderingMode(.original)
                                            .clipShape(Capsule())
                                            .shadow(radius: 5)
                                        Text("Hi?")
                                    }
                                    
                                })
                                
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.black)
                    .font(.title.bold())
                
                Spacer()
            }
            
            
            
        }.alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestions)
        } message: {
            Text("Your score is \(score)")
        }
            
        }
    }
    
    func flagTapped(number: Int){
        if number == correctAnswer{
                scoreTitle = "Correct"
                score += 1
        }
        else{
            scoreTitle = "Wrong! \n That is the flag of \(countries[number])"
            score -= 1
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

