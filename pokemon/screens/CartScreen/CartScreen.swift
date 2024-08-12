//
//  CartScreen.swift
//  pokemon
//
//  Created by Spark M1 on 09/08/2024.
//

import SwiftUI

struct CartScreen: View {
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
                Button{
                    
                }
                label:{
                    
                }
                .listStyle(.insetGrouped)
                .listRowSpacing(10)
                
                
            }
           
            .navigationTitle("My Carts is ") // Custom title for the Cart screen
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    CartScreen()
}
