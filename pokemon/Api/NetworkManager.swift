import Foundation

enum NetworkError: Error {
    case invalidResponse
    case invalidUrl
    case requestFailed
    case outofstack
    case notfound
    case tokken
    case decoding
    case serverError(statusCode: Int)
    case customError(String)
}

class NetworkManager {
    
    private let session = URLSession(configuration: .default)
    
    func fetchRequest<T: Codable>(type: T.Type, url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        ApiHandler().fetchdata(url:url) { result in
            switch result {
                
            case .success(let data):
                ResponseHandler().fetchModel(type: type, data: data, completion: { decoded in
                    switch decoded {
                        
                    case .success(let model):
                        completion(.success(model))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

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
