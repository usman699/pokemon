//
//  CartCard.swift
//  pokemon
//
//  Created by Spark M1 on 09/08/2024.
//

import SwiftUI

struct CartCard: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        HStack(spacing:30){
                Image("9439678")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .cornerRadius(80)
            VStack (alignment: .leading, spacing: 10) {
                HStack{
                    Text("ANGULR")
                    Spacer()
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
                HStack{
                    Text("$129")
                        .foregroundColor(.blue)
                }
                
              
            }
            
                .padding([.trailing], 10)
            VStack(spacing:5){
                Button(){}
            label:{
                Image(systemName: "minus")
            }
                
                Text("2")
                
                Button(){}
            label:{
                Image(systemName: "plus")
            }
            .background(Color(.systemGray6))
            .cornerRadius(20)
            }
          
            }
     
        .frame(height: 50)
            .frame(maxWidth: .infinity)
            .padding(10)
            // Background color for dark/light mode
            .cornerRadius(10) // Apply corner radius to the entire card
            //  .shadow(color:   Color(.black).opacity(0.4), radius: 3 ) // Apply shadow
        
    }
}
#Preview {
    CartCard()
}
