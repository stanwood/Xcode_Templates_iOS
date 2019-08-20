//
//  EndPoint.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2019 ORGANISATION. All rights reserved.
//
import Foundation
import Moya

// MARK: - EndPoints

enum EndPoint {
    
    // Remove
    case `default`
}

extension EndPoint: TargetType {
    
    // MARK: - Task
    
    var baseURL: URL {
        return URL(string: Configurations.FirebaseConfig.value(for: .baseURL) ?? "")!
    }
    
    var path: String {
        return "/"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        fatalError()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    // MARK: - Decoding
    
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .convertFromSnakeCase
    }
    
    var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy {
        return .iso8601
    }
    
    // MARK: - Cache
    
    enum CachePolicy {
        case noCache //Doesn't return from cache
        case fromCache //If cache { completion(cache); return } else { completion(new)}
        case cacheAndRefresh //if cache { completion(cache) } completion(new)
    }
    
    var cacheKey: String {
        return String()
    }
    
    var cacheExpiry: TimeInterval {
        return 0
    }
    
    var shouldCache: Bool {
        return false
    }
    
    var cachePolicy: CachePolicy {
        return .noCache
    }
}
