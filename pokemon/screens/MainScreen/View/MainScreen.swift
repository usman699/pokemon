//
//  Mainpage.swift
//  pokemon
//
//  Created by Spark M1 on 08/08/2024.
//

import SwiftUI

struct MainScreen: View {
    @StateObject private var viewModel = MainViewmodel()

    @Environment(\.colorScheme) var colorScheme
        private let adaptiveColumn = [
            GridItem(.adaptive(minimum: 150)),
            GridItem(.adaptive(minimum: 150))
          
        ]
 
    @State private var navigateToDetail: Bool = false
    @State private var searchText = ""
  
    var body: some View {
        
        NavigationStack {
      
            VStack(spacing: 15) {
                Text("Which Pokemon is your Favorite?")
                    .font(.title)

              //  customTexfield()
            
                
                  if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    ScrollView {
                        
                        LazyVGrid(columns: adaptiveColumn, spacing:  0) {
                            ForEach(searchResults) { item in
                               
                                    GridCardItems(item: item)
                                    .padding(10)
                            
                            }
                        }
                        .searchable(text: $searchText, prompt: Text("Search Pokémon"))
                        
                        
                        .padding(.top, 5)
                    }
                }
            }
             .overlay(
                        Group {
                            if viewModel.isLoading {
                                ProgressView()
                                    .zIndex(1)
                            }
                        }
                    )
            
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
                        .navigationBarHidden(false)
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
        .onAppear() {
                        Task {
                            await MainActor.run {
                                viewModel.fetchingdata()
                                }
                            }
                        }
                    }
    var searchResults: [Datum] {
          if searchText.isEmpty {
            
              return viewModel.data
              
              
          } else {
              
           
              return viewModel.data.filter { $0.name?.lowercased().contains(searchText.lowercased()) ?? false }
              
          }
      }
        }
    
    
#Preview {
    Mainpage()
}


