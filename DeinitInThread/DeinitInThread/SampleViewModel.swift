//
//  SampleViewModel.swift
//  DeinitInThread
//

import SwiftUI

final class SampleViewModel: ObservableObject {

	deinit {
		if !Thread.isMainThread {
			debugPrint("**** DEINIT running in some thread \(Thread.current)")
		} else {
			debugPrint("**** DEINIT running in the main thread")
		}
	}
}
