//
//  SplashScreen.swift
//  pokemon
//
//  Created by Spark M1 on 08/08/2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var animationGradient : Bool = false
    var body: some View {
        VStack(spacing:10){
            Text("Welcome to Pokemon App")
                
                .font(.title2)
                .foregroundColor(.white)
            
            Text("Explore, collect, and trade your favorite Pokémon cards")
                .font(.footnote)
                .foregroundColor(.white)
            
            
            Button {
                   
            } label: {
                Image(systemName: "arrow.forward.circle.fill")

                
            }
            .font(.title)
            
            .foregroundColor(.white)
            .frame(width: 90, height: 90)
        }
        
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .background{
            LinearGradient(colors : [Color.blue ,Color.green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .hueRotation(.degrees(animationGradient ? 180 : 0))
                .onAppear(
                    perform: {
                        withAnimation(.easeInOut(duration: 7).repeatForever(autoreverses: true)){
                            animationGradient.toggle()
                        }
                    }
                )
        }
    }
}

#Preview {
    SplashScreen()
}
