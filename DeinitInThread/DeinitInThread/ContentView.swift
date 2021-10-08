//
//  ContentView.swift
//  DeinitInThread
//

import SwiftUI

enum ContentType: Int, CaseIterable {
	case homeScreen
	case contact
}

class AppState: ObservableObject {
	@Published var contentType: ContentType = .homeScreen
}

struct ContentView: View {
	@EnvironmentObject var appState: AppState

	var body: some View {
		VStack(spacing: 0) {
			switch appState.contentType {
				case .homeScreen:
					Button {
						appState.contentType = .contact
					} label: {
						Text("Switch to Sample View")
					}
				default:
					SampleView()
			}

		}.animation(.default, value: appState.contentType)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
