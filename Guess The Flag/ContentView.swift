//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Dhurv Dugar on 13/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Group{
                RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .top, startRadius: 20, endRadius: 400)
            }
            VStack(spacing: 20){
//                Button("Delete Selection", role: .destructive, action: executeDelete)
//                Button("button2"){ }
//                    .buttonStyle(.bordered)
//                Button("button 3", role: .destructive){ }
//                    .buttonStyle(.bordered)
//
//                Button("button 4") {}
//                    .buttonStyle(.borderedProminent)
//
//                Button("button 5", role: .destructive) { }
//                    .buttonStyle(.borderedProminent)
//
//                Button("button 6"){ }
//                    .buttonStyle(.borderedProminent)
//                    .tint(.mint)
                
                Button {
                    print("Button was tapped")
                } label: {
                    Text("tap me!")
                        .padding()
                        .foregroundColor(.white)
                        .background(.mint)
                }
                
                
                Button("tap me!") { }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
            }
        }.ignoresSafeArea()
        
        
    }
    
    func executeDelete() {
        print("now deleting...")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//#C7C7C7

