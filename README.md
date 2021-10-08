## Description

This simple Xcode project demonstrates an issue with SwiftUI where a View animation triggers deinit in a thread

![](video.mov)


## Steps to Reproduce

- Download the sample Xcode project DeinitInThread
- Open this project in Xcode 13.0
- Compile and run this project on iOS 15.0 on a device or simulator
- Tap on the button `Switch to Sample View`
- Tap on the button `Switch to Content View`

Result: In the Xcode console you will see a warning that the deinit is called in a thread

```
"**** DEINIT running in some thread <NSThread: 0x600001c899c0>{number = 8, name = (null)}"
```

## Reproducibility

- This issue can be reproduced with Xcode 13.0 when running on iOS 15.0 on a device or simulator.
- This issue was not yet tested on iOS 15.1 beta.


## Details

- The Xcode project contains 2 SwiftUI views.
- A button lets you switch from one view to the second view with an animation.
- If the view has a viewModel, the `deinit` for the viewModel is called in a thread rather than in the main thread:

```
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
```