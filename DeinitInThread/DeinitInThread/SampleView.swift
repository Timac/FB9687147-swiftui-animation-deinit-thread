//
//  SampleView.swift
//  DeinitInThread
//

import SwiftUI

struct SampleView: View {
	@ObservedObject var viewModel = SampleViewModel()
	@EnvironmentObject var appState: AppState

	var body: some View {
		Button {
			appState.contentType = .homeScreen
		} label: {
			Text("Switch to Content View")
		}
	}
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
		SampleView()
    }
}
