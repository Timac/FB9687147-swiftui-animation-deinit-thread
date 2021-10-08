//
//  DeinitInThreadApp.swift
//  DeinitInThread
//

import SwiftUI

@main
struct DeinitInThreadApp: App {
	@ObservedObject var appState = AppState()
	
    var body: some Scene {
        WindowGroup {
			ContentView().environmentObject(appState)
        }
    }
}
