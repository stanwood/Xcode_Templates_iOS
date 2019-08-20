//
//  TrackingManager.swift
//  PROJECT
//
//  Created by Tal Zion on 20/08/2019.
//  Copyright © 2019 Company Limited. All rights reserved.
//

import Foundation
import StanwoodAnalytics

class TrackingManager {
    
    private var analytics: StanwoodAnalytics?
    
    var isEnabled: Bool {
        return StanwoodAnalytics.trackingEnabled()
    }
    
    static var shared = TrackingManager(application: UIApplication.shared)
    
    private var firebasePlistFileName: String {
        #if DEBUG
        return "GoogleService-Info-Debug"
        #elseif Stage
        return "GoogleService-Info-Stage"
        #else
        return "GoogleService-Info"
        #endif
    }
    
    init(application: UIApplication) {
        /// Uncomment once adding Firebase Info plist files
        /*
         let firebaseTracker = FirebaseTracker.FirebaseBuilder(context: application, configFileName: firebasePlistFileName)
         .build()
         let fabricTracker = FabricTracker.FabricBuilder(context: application, key: nil).build()
         
         var analyticsBuilder = StanwoodAnalytics.builder()
         .add(tracker: firebaseTracker).add(tracker: fabricTracker)
         
         #if DEBUG
         analyticsBuilder = analyticsBuilder.setDebuggerNotifications(enabled: true)
         #endif
         
         analytics = analyticsBuilder.build()
         */
    }
    
    func setTracking(enabled: Bool) {
        analytics?.setTracking(enabled: enabled)
    }
    
    func track(event: TrackingParameters) {
        analytics?.track(trackingParameters: event)
    }
    
    func track(_ error: Error?) {
        guard let nserror = error as NSError? else { return }
        analytics?.track(error: nserror)
    }
}
