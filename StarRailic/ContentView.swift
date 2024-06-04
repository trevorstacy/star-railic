//
//  ContentView.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    let startColor = Color("BackgroundDarker")
    let endColor = Color("Background")
    
    @State private var showWelcomeView: Bool = true
    @State private var gradientStartPoint = UnitPoint(x: 0.5, y: 0)
    @State private var gradientEndPoint = UnitPoint(x: 0.5, y: 0)

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [startColor, endColor]),
                    startPoint: gradientStartPoint,
                    endPoint: gradientEndPoint
                )
                .edgesIgnoringSafeArea(.all)
                
                if showWelcomeView {
                    VStack(spacing: 32) {
                        Image("StarRailLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(
                                Text("Relic Scorer")
                                    .foregroundColor(.white)
                                    .bold()
                                    .italic()
                                    .padding(.bottom)
                                    .padding(.leading)
                                    .shadow(color: .white, radius: 40)
                                    .offset(x: -21, y: -32),
                                alignment: .bottomTrailing
                            )
                        
                        Button(action: {
                            showWelcomeView.toggle()
                        }) {
                            Text("Continue as Guest")
                                .foregroundStyle(Color("SecondaryTextColor"))
                        }
                        .buttonStyle(SlantedStrokeFillButtonStyle(
                            strokeColor: Color("ButtonStroke"),
                            fillColor: Color("ButtonBackground"),
                            width: 270,
                            height: 54
                        ))
                    }
                } else {
                    RelicUploader()
                }
            }
        }
        .background(LinearGradient(
            gradient: Gradient(colors: [startColor, endColor]),
            startPoint: gradientStartPoint,
            endPoint: gradientEndPoint
        )
        .edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ContentView()
}
