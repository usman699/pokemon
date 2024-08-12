//
//  searchbar.swift
//  pokemon
//
//  Created by Spark M1 on 08/08/2024.
//

import SwiftUI

struct customTexfield: View {
    @Environment(\.colorScheme) var colorschemesearchbar
    static let customBlack = Color(hex: "191919")
    static var nametwo = "Search Card"
    @State   private var  name = String()
    var body: some View {
        
      
        HStack {
                                Spacer(minLength: 20)
                                HStack (alignment: .center,
                                        spacing: 10) {
                                    Image(systemName: "magnifyingglass")
                                    
                                                .resizable()
                                                .frame(width: 22, height: 22, alignment: .center)
                                                .foregroundColor(colorschemesearchbar == .dark ?  Color.white : Color.black)
                                                
                                                .frame(minWidth: 0, maxWidth: 30)
                                                .frame(minHeight: 0, maxHeight: 33)
                                   
                                    TextField ("Search Pokemon", text: $name ,
                                               
                                               
                                               onEditingChanged: {_ in
                                        customTexfield.nametwo = ""
                                    })
                                    .foregroundColor(colorschemesearchbar == .dark ?  Color.white : Color.black)
                                        .accentColor(Color.white)
                                       
                                       
                                        
                                }  // HSTack
                                        .padding(10)
                                                    .padding(.leading, 5)
                                                    .background( colorschemesearchbar == .dark ?  Color(.systemGray6)  : Color.white)  // Background color
//                                                    .overlay(
//                                                        RoundedRectangle(cornerRadius: 20)
//                                                            .stroke(Color.gray, lineWidth: 1)
//                                                    )
                                                    .cornerRadius(20)
                                                    .shadow(radius:8 )
                                                    Spacer(minLength: 20)
                        }
    }
}

#Preview {
    customTexfield()
}
