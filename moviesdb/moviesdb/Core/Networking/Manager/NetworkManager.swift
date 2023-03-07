//
//  NetworkManager.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
    
    private let session = URLSession(configuration: .default)
    
    func request<T: Decodable>(_ request: ApiRequestProtocol, handler: @escaping NetworkReponseHandler<T>) {
        
        var urlRequest = URLRequest(url: request.pathUrl)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let completionOnMain: (Result<T, Error>) -> Void = { result in
            DispatchQueue.main.async {
                handler(result)
            }
        }
        
        let urlsession = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completionOnMain(.failure(error))
            }
            guard let urlResponse = response as? HTTPURLResponse else {
                return completionOnMain(.failure(NetworkError.invalidResponse))
            }
            self.showDataInJson(data: data)
            debugPrint(urlResponse)
            if !(200..<300).contains(urlResponse.statusCode) {
                return completionOnMain(.failure(NetworkError.invalidStatusCode(urlResponse.statusCode)))
            }
            guard let data = data else {
            //    if request.needResponse {
                    return completionOnMain(.failure(NetworkError.invalidResponse))
             //   }
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completionOnMain(.success(decodedData))
            } catch {
                debugPrint(error)
                completionOnMain(.failure(NetworkError.decodedError))
            }
        }
        urlsession.resume()
    }
    
    func showDataInJson(data: Data?) {
        do {
            guard let data = data else { return }
            if let json = try JSONSerialization
                .jsonObject(with: data, options: []) as? [String: Any] {
                debugPrint(json)
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
    }
    
}
