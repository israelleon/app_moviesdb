//
//  AuthValidateLoginRequest.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import Foundation

struct JsonBodyRequest<T: Codable>: ApiRequestProtocol {
    var pathUrl: URL
    var method: HttpMethod
    var body: Data?
    var needResponse: Bool
    
    init(endpoint: ConfigEndpointProtocol, body: T, needResponse: Bool = false, uriParams: String? = nil, replaceUriId: [String: String] = [:]) {
        var finalEndpoint = endpoint.uri
        if let uriParams = uriParams {
          finalEndpoint = finalEndpoint + uriParams
        }
        
        replaceUriId.forEach {
            finalEndpoint = finalEndpoint.replacingOccurrences(of: $0.key, with:$0.value)
        }
        
        self.pathUrl = URL(string: finalEndpoint)!
        self.method = HttpMethod(rawValue: endpoint.method)!
        self.body = try? JSONEncoder().encode(body)
        self.needResponse = needResponse
    }
}
