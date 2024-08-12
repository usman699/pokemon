//
//  favrioteScreen.swift
//  pokemon
//
//  Created by Spark M1 on 09/08/2024.
//

import SwiftUI

struct favrioteScreen: View {
    private var data  = Array(1...20)
    @Environment(\.colorScheme) var colorScheme
      

    var body: some View {
        NavigationStack{
          
            VStack{
                List{
                    ForEach(data, id: \.self) { item in
                        VStack(spacing:20){
                            favoritesCard()
                              
                        }
                        
                    }
                    
                }
                
                .listRowSpacing(10)
            }  // Add padding to the top of the VStack
                
                
            .navigationTitle("Favorites")
            .toolbar {
                // Primary action toolbar item
                ToolbarItem(placement: .primaryAction) {
                  customTexfield()
                }
            }
        }
        
        
     
    }
        
}

#Preview {
    favrioteScreen()
}
