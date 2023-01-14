//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Dhurv Dugar on 13/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert : Bool = false
    
    var body: some View {
        
        Button("Some button"){
            showingAlert = true
        }.alert("Important alert", isPresented: $showingAlert){
            Button("Delete", role: .destructive) { }
            Button("Cancel") { }
        } message: {
            Text("Please read this")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

