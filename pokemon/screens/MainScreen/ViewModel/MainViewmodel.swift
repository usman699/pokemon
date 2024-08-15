//
//  MainViewmodel.swift
//  pokemon
//
//  Created by Spark M1 on 12/08/2024.
//

import Foundation
import Observation
class MainViewmodel:ObservableObject{
    
    @Published var data: [Datum] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    var mainserves = MainviewServices()
    func fetchingdata() {
        print("function called")
   
        mainserves.getcarddata(competion: {result in
            switch result {
                
            case .success(let datas):
                print("function called in success")
                DispatchQueue.main.sync {
                
                    self.data = datas.data
                }
               
            case .failure(let error):
                print("function called in success")
                switch (error){
                    
                case .invalidResponse:
                    print("invalid response")
                case .invalidUrl:
                    print("invalid data")
                case .requestFailed:
                    print("invalid request")
               
                case .decoding:
                    print("deconding")
                case .serverError(statusCode: let statusCode):
                    print("\(statusCode)")
                case .customError(let error):
                    print("\(error)")
                case .outofstack:
                    print("out of stack")
                case .notfound:
                    print("out of stack")
                case .tokken:
                    print("")
                }
            }
            
        })
    }}
        
        
        
        
        
