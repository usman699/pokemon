import Foundation
import SwiftUI

@MainActor
class MainViewmodel: ObservableObject {
    @Published var data: [Datum] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var mainserves = MainviewServices()
    
    func fetchingdata() {
        print("function called")
        isLoading = true
        
        mainserves.getcarddata { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let datas):
                    print("function called in success")
                    self.data = datas.data
                    self.isLoading = false
                    
                case .failure(let error):
                    print("function called in failure")
                    self.isLoading = false
                    
                    switch error {
                    case .invalidResponse:
                        self.errorMessage = "Invalid response from server."
                    case .invalidUrl:
                        self.errorMessage = "Invalid URL."
                    case .requestFailed:
                        self.errorMessage = "Request failed."
                    case .decoding:
                        self.errorMessage = "Failed to decode data."
                    case .serverError(statusCode: let statusCode):
                        self.errorMessage = "Server error with status code \(statusCode)."
                    case .customError(let error):
                        self.errorMessage = "Custom error: \(error)"
                    case .outofstack:
                        self.errorMessage = "Stack overflow."
                    case .notfound:
                        self.errorMessage = "Resource not found."
                    case .tokken:
                        self.errorMessage = "Token error."
                    }
                }
            }
        }
    }
}

