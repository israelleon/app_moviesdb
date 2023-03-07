//
//  AccountNewTokenRequest.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

struct NoBodyRequest: ApiRequestProtocol {
    var pathUrl: URL
    var method: HttpMethod
    var body: Data?
    var needResponse: Bool = false
    
    init(endpoint: ConfigEndpointProtocol, uriParams: String? = nil, replaceUriId: [String: String] = [:]) {
        var finalEndpoint = endpoint.uri
        if let uriParams = uriParams {
          finalEndpoint = finalEndpoint + uriParams
        }
        
        replaceUriId.forEach {
            finalEndpoint = finalEndpoint.replacingOccurrences(of: $0.key, with:$0.value)
        }
                
        self.pathUrl = URL(string: finalEndpoint)!
        self.method = HttpMethod(rawValue: endpoint.method)!
    }
}
