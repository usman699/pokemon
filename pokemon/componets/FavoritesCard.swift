//
//  favoritesPage.swift
//  pokemon
//
//  Created by Spark M1 on 09/08/2024.
//

import SwiftUI

struct favoritesCard: View {
    @Environment(\.colorScheme) var colorscheme
    var body: some View {
        HStack{
            Image("9439678")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .cornerRadius(10)
            VStack (alignment: .leading, spacing: 20) {
                HStack{
                    Text("ANGULR")
                    Spacer()
                    Button(){}
                label:{
                        Image(systemName: "suit.heart")}
                .foregroundColor(colorscheme == .dark ? Color.white : Color.black)
                }
                Text("This is greate way to test ")
            }
            .padding([.bottom], 30)
            .padding([.trailing], 10)
        }
    
        .frame(maxWidth: .infinity)
        .padding(10)
       // Background color for dark/light mode
        .cornerRadius(10) // Apply corner radius to the entire card
      //  .shadow(color:   Color(.black).opacity(0.4), radius: 3 ) // Apply shadow
    }
}

#Preview {
    favoritesCard()
}
