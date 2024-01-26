//
//  NetworkManager.swift
//  TrackingCryptoApp
//
//  Created by ad on 25/01/2024.
//

import Foundation
import Combine

class NetworkManager {
    static private let BASE_URL = "https://sandbox-api.coinmarketcap.com/v1/"
    static private let API_SECRET_KEY = "9f5456a2-791a-4681-8cbd-34513cbffbe5"
    
    static private func getRequest(path: String) throws -> URLRequest {
        guard let url = URL(string: "\(BASE_URL)\(path)") else {
            throw URLError(URLError.Code.badURL)
        }
        var request = URLRequest(url: url)
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        request.setValue(API_SECRET_KEY, forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        
        return request
    }
    
    static func get(url: String) throws -> AnyPublisher<Data, Error>  {
       
        guard let request = try? getRequest(path: url) else {
            throw URLError(URLError.Code.badURL)
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap {
                (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    // handle error
                    print("error")
                    throw URLError(URLError.Code.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func post() {
        
    }
    
    static func delete() {
        
    }
    
    static func batch() {
        
    }
    
    static func downloadFile(urlString: String) throws -> AnyPublisher<Data, Error>  {
        guard let url = URL(string: urlString) else {
            throw URLError(URLError.Code.badURL)
        }
        
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap {
                (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    // handle error
                    print("error")
                    throw URLError(URLError.Code.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleCompletionResponse(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("error: \(error.localizedDescription)")
        }
    }
}
