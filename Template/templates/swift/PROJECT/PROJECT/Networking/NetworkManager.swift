//
//  NetworkingManager.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © TODAYS_YEAR ORGANISATION. All rights reserved.eserved.
//

import Foundation
import Moya
import EGOCache

class NetworkManager: Networking {
    
    private var provider: MoyaProvider<EndPoint>?
    private var authenticator: Authenticating?
    
    init(authenticator: Authenticating? = nil) {
        self.authenticator = authenticator
        
        configure()
    }
    
    func request<T>(_ endpoint: EndPoint, completion: @escaping (Constants.Result<T>) -> Void) where T : Codable {
        
        
        guard let authenticator = authenticator else {
            self.makeRequest(endpoint, completion: { (result: Constants.Result<T>) in
                completion(result)
            })
            return
        }
        
        guard authenticator.canAuthenticate else {
            completion(.failure(APIError.Predefind.cannotAuthenticateConnectionError))
            return
        }
        
        authenticator.authenticate { [unowned self, endpoint = endpoint, completion = completion] in
            
            self.makeRequest(endpoint, completion: { (result: Constants.Result<T>) in
                completion(result)
            })
        }
    }
    
    private func configure() {
        if authenticator == nil {
            provider = MoyaProvider<EndPoint>()
        } else {
            let requestClosure: MoyaProvider<EndPoint>.RequestClosure = {
                [unowned self] (endpoint: Endpoint, done: @escaping MoyaProvider.RequestResultClosure) in
                
                guard let request = try? endpoint.urlRequest() else { return }
                
                self.authenticator?.authenticate(request, done: { (request) in
                    done(.success(request))
                })
            }
            provider = MoyaProvider<EndPoint>(requestClosure: requestClosure)
        }
    }
}

extension NetworkManager {
    
    fileprivate func makeRequest<T: Codable>(_ endpoint: EndPoint, completion: @escaping (Constants.Result<T>) -> Void) {
        
        if let data = EGOCache.global().data(forKey: endpoint.cacheKey) {
            do {
                
                let model: T = try data.parse(type: T.self, dateDecodingStrategy: endpoint.dateDecodingStrategy, keyDecodingStrategy: endpoint.keyDecodingStrategy)
                
                completion(.success(model))
                return
            } catch {}
        }
        
        guard let provider = provider else { return }
        
        main {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        provider.request(endpoint) { [endpoint = endpoint] result in
            
            main {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            
            switch result {
            case .success(let response):
                do {
                    let model: T = try response.data.parse(type: T.self, dateDecodingStrategy: endpoint.dateDecodingStrategy, keyDecodingStrategy: endpoint.keyDecodingStrategy)
                    
                    if endpoint.shouldCache {
                        EGOCache.global().setData(response.data, forKey: endpoint.cacheKey, withTimeoutInterval: endpoint.cacheExpiry)
                    }
                    completion(.success(model))
                } catch {
                    if let apiError = try? response.data.parse(type: APIError.self, dateDecodingStrategy: endpoint.dateDecodingStrategy, keyDecodingStrategy: endpoint.keyDecodingStrategy) {
                        completion(.failure(apiError))
                    } else {
                        completion(.failure(APIError(error: error)))
                    }
                }
                
                
            case .failure(let error):
                completion(.failure(APIError(error: error)))
            }
        }
    }
}

extension Data {
    
    func parse<T: Codable>(type: T.Type, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy?, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy) throws -> T {
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = keyDecodingStrategy
        
        if let dateDecodingStrategy = dateDecodingStrategy {
            jsonDecoder.dateDecodingStrategy = dateDecodingStrategy
        }
        return try jsonDecoder.decode(type, from: self)
    }
}
