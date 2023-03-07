//
//  AppConfig.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 05/03/23.
//

import Foundation

struct AppConfig: ConfigEnvProtocol {
    private var contents: [String: AnyObject] = [:]
    
    var env: String? {
        guard let client = self.contents["client"] as? [String: AnyObject],
              let version = client["version"] as? String else { return nil }
        return version
    }
    
    init(configFile: String = "config_app.plist") {
        guard let fileURL = URL(resource: URLResource(name: configFile)) else {
            fatalError("config no loaded")
        }
        self.contents = NSDictionary(contentsOf: fileURL) as? [String: AnyObject] ?? [:]
    }
    
    func getEnpoint(endpoint: String, forKey key: String) -> ConfigEndpointProtocol? {
        guard let client = contents["client"] as? [String: AnyObject],
              let basePath = client["uri"] as? String,
              let version = client["version"] as? String,
              let language = client["language"] as? String,
              let apiKey = client["api_key"] as? String,
              let endpoints = client["endpoints"] as? [String: AnyObject],
              let endpoint = endpoints[endpoint] as? [String: AnyObject],
              let object = endpoint[key] as? [String: String],
              let path = object["path"],
              let method = object["method"] else {
            return nil
        }
        let uri = "\(basePath)\(version)\(path)?api_key=\(apiKey)&language=\(language)"
        return ConfigEndpoint(uri: uri, method: method)
    }
}

fileprivate struct ConfigEndpoint: ConfigEndpointProtocol {
    var uri: String
    var method: String
}
