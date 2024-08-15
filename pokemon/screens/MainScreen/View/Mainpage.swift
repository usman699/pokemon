//
//  Mainpage.swift
//  pokemon
//
//  Created by Spark M1 on 08/08/2024.
//

import SwiftUI

struct Mainpage: View {

    private var data  = Array(1...20)
    @Environment(\.colorScheme) var colorScheme
        private let adaptiveColumn = [
            GridItem(.adaptive(minimum: 150)),
            GridItem(.adaptive(minimum: 150))
          
        ]
        
    var body: some View {
      
        TabView {
           MainScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            favrioteScreen()
                 .tabItem {
                     Label("Favorite", systemImage: "star")
                 }
        
        }
        .accentColor(colorScheme == .light ? Color.black : Color.white )

        }
    }
#Preview {
    Mainpage()
}

