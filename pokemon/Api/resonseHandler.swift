//
//  resonseHandler.swift
//  pokemon
//
//  Created by Spark M1 on 15/08/2024.
//

import Foundation
//class ResponseHandler{
//    func fetchModel<T:Codable>(type:T.Type  ,data : Data, completion: (Result<T, NetworkError>) -> Void) {
//        let commentResponse = try? JSONDecoder().decode(type.self, from: data)
//        if let  commentResponse = commentResponse{
//            return completion(.success(commentResponse))
//        }
//        else{
//            completion(.failure(.decoding))
//        }
//    }
//}
class ResponseHandler {
    func fetchModel<T: Codable>(type: T.Type, data: Data, completion: (Result<T, NetworkError>) -> Void) {
        do {
            let decodedData = try JSONDecoder().decode(type.self, from: data)
            completion(.success(decodedData))
        } catch let DecodingError.dataCorrupted(context) {
            print("Data corrupted: \(context.debugDescription)")
            completion(.failure(.decoding))
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key.stringValue)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            completion(.failure(.decoding))
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            completion(.failure(.decoding))
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            completion(.failure(.decoding))
        } catch {
            print("Error decoding data: \(error.localizedDescription)")
            completion(.failure(.decoding))
        }
    }
}
