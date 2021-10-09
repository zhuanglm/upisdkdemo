//
//  upisdkdemoApp.swift
//  upisdkdemo
//
//  Created by Raymond Zhuang on 2021-09-07.
//

import SwiftUI
import CPaySDK

@main
struct upisdkdemoApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView().onOpenURL { url in
                print("open URL is \(url)")
                CPayManager.processOpenURL(UIApplication.shared, url: url, options: [:])
            }
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                print("App is active")
//                CPayManager.initSDK()
//                CPayManager.setupMode(CPAY_MODE_UAT)
            case .inactive:
                print("App is inactive")
            case .background:
                print("App is in background")
            @unknown default:
                print("Oh - interesting: I received an unexpected new value.")
            }
        }
    }
}
