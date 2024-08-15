//
//  CartScreen.swift
//  pokemon
//
//  Created by Spark M1 on 09/08/2024.
//

import SwiftUI

struct CartScreen: View {
    var hasTitle  = Bool()
    private var data  = Array(1...20)
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(data, id: \.self) { item in
                        CartCard()
                    }
                }
                .listRowSpacing(10)
                HStack {
                    Spacer()
                        Text("Total Price ")
                        Text("$123")
                        .foregroundStyle(.blue)
                    Spacer()
                    Button("Add to cart") {
                        // Action here
                    }
                    .frame(width: 150, height: 46)
                    .background(Color.blue) // Background color of the button
                    .foregroundStyle(.white)
                    .cornerRadius(20)
                    .padding(.trailing, 20) // Adjust this value for desired spacing
                }
                .frame(height: 50)
                .background(
                    Color.clear.opacity(0.0)
                                 
                                    .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
                                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 10, y: 10)
                                    .blur(radius: 1)
                                )
            }
         
            
       
            .navigationTitle("My Cart") // Custom title for the Cart screen
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
        }
        
        .toolbar(.hidden, for: .tabBar)
    }
    
}
#Preview {
    CartScreen()
}
