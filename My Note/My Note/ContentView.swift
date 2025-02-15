//
//  ContentView.swift
//  My Note
//
//  Created by Janak Khadka on 15/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in  //GeometryReader le chai parent view vannale yaa chai Content view ko size and position reads garera adjust garna help garxa
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    Color(red: 58/255,green: 127/255, blue: 147/255)
                )
                .frame(height: geometry.size.height / 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.white.opacity(0.3))
                        .frame(width: .infinity,
                            height: 200)
                        .overlay(
                            VStack {
                                Text("JK")
                                    .font(.custom("Zapfino", size: 35))
                                    .fontWeight(.bold)
                                    //.padding(.bottom, 1)
                                Text("Welcome to JK Notes")
                                    .font(.system(size: 24, weight: .bold))
                            }
                        )
                        .padding()
                        .foregroundColor(.white)
                        
                        
                )
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    ContentView()
}
