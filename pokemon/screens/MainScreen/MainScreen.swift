//
//  Mainpage.swift
//  pokemon
//
//  Created by Spark M1 on 08/08/2024.
//

import SwiftUI

struct MainScreen: View {

    private var data  = Array(1...20)
    @Environment(\.colorScheme) var colorScheme
        private let adaptiveColumn = [
            GridItem(.adaptive(minimum: 150)),
            GridItem(.adaptive(minimum: 150))
          
        ]
    @State private var navigateToDetail: Bool = false
    var body: some View {
        NavigationStack {
      
            VStack (spacing:15){
                Text("Which Pokemon is your Favroite?")
                    .font(.title)
                customTexfield()
                

                ScrollView {
                    VStack {
                        LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                            ForEach(data, id: \.self) { item in
                               GridCardItems()
                            }
                        }
                        .padding(.top, 5) // Add padding to the top of the VStack
                    }
                }
           
                
                }
       
            .navigationTitle("Pokemon")
            .toolbar {
                            // Primary action toolbar item
                ToolbarItem(placement: .primaryAction) {
                    ZStack{
                        NavigationLink(destination: CartScreen()) {
                                           Image(systemName: "cart")
                                               .resizable()
                                               .frame(width: 30, height: 30)
                                               .padding()
                                       }
                        
                        .frame(width: 40)
                        .padding(5)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        Button ("1"){
                            // Action for the button
                        }
                        .padding(.leading, 38)
                        .padding(.bottom, 38)
                        .foregroundColor(.red)
                    }
                
                }
                            // Top bar leading toolbar item
                            ToolbarItem(placement: .topBarLeading) {
                                Button {
                                    // Action for the button
                                } label: {
                                    Image("9439678")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(50)
                                }
                                .padding(5)
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }
                        }
            
            }
       

        }
    }
#Preview {
    Mainpage()
}


