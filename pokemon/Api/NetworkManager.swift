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




