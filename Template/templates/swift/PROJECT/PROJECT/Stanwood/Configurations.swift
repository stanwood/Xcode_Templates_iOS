//
//  Configurations.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2019 ORGANISATION. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig

class Configurations {
    
    enum FirebaseConfig: String {
        
        case baseURL = "base_url"
        
        static var isRemoteConfigActivated: Bool = false
        
        static func value<T: Any>(for key: FirebaseConfig) -> T? {
            let value = RemoteConfig.remoteConfig()[key.rawValue]
            
            switch T.self {
            case is String.Type: return value.stringValue as? T
            case is [String].Type: return value.stringValue?.toArray as? T
            case is Data.Type: return value.dataValue as? T
            case is Bool.Type: return value.boolValue as? T
            case is Int.Type: return value.numberValue?.intValue as? T
            default: return nil
            }
        }
    }
    
    static func fetchRemoteConfig(_ completion: @escaping CompletionBlock) {
        RemoteConfig.remoteConfig().setDefaults(fromPlist: Constants.FirebaseConfig.defaults)
        RemoteConfig.remoteConfig().fetch { (status, error) in
            switch status {
            case .success:
                RemoteConfig.remoteConfig().activate(completionHandler: { (error) in
                    if let error = error as Error? {
                        // track error
                        TrackingManager.shared.track(error)
                    }
                    
                    completion()
                })
                Configurations.FirebaseConfig.isRemoteConfigActivated = true
            case .failure, .noFetchYet, .throttled:
                if let error = error as Error? {
                    // track error
                    TrackingManager.shared.track(error)
                }
                
                DispatchQueue.global(qos: .utility).async {
                    Configurations.fetchRemoteConfig(completion)
                }
                
            @unknown default:
                
                DispatchQueue.global(qos: .utility).async {
                    Configurations.fetchRemoteConfig(completion)
                }
            }
        }
    }
}
