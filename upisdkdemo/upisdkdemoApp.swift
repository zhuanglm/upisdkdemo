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
            ContentView()
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                print("App is active")
                CPayManager.initSDK()
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
