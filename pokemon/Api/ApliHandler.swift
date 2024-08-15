//
//  ApliHandler.swift
//  pokemon
//
//  Created by Spark M1 on 13/08/2024.
//

import Foundation

class ApiHandler{
    func fetchdata(url:URL ,completion:@escaping(Result<Data , NetworkError>) -> Void){
        URLSession.shared.dataTask(with: url) { data ,response ,error in
            guard let data = data , error == nil else{
                return completion(.failure(.invalidUrl))
            }
            completion(.success(data))
        }.resume()
    }
}
