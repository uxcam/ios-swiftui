# UXCam-SwiftUI

## Version: 0.8.5 - pre-release - use with caution

This package is the framework for the UXCam SwiftUI wrapper.
It depends on the main UXCam framework, v3.4.0 or higher.

Internally it uses some of the ideas in the [Introspect](https://github.com/siteline/SwiftUI-Introspect.git) library, but that library itself is not included here.


## Using SwiftUI with UXCam


**Starting the UXCam library**

Add an `init` method to your main App struct.

Call `UXCamSwiftUI.start(with: UXCamSwiftUI.Configuration)` with your configuration to start the UXCam SDK in SwiftUI mode.
**NB:** The configuration option `enableAutomaticScreenNameTagging` is not available in the UXCamSwiftUI library (manual screen tagging is required in SwiftUI)

eg. 

```swift
	init()
	{
		UXCam.optIntoSchematicRecordings()
		let config = UXCamSwiftUI.Configuration(apiKey: "YOUR API KEY")
		UXCamSwiftUI.start(with: config)
	}
```

To call a completion block when the UXCam session verify completes use:  
  `UXCamSwiftUI.start(with: UXCamSwiftUI.Configuration, sessionStarted: ((Bool) -> ())? = nil)` - the flag indicates if a session started or not


### Screen name tagging

Due to the nature of SwiftUI the automatic screen name tagging in UXCam for UIKit is not available.

To name screens use `func uxcamTagScreenName(_ screenName: String) -> some View` on the View

eg.  

```swift
var body: some View
{
	Text("Hello world")
		.uxcamTagScreenName("HelloScreen")
}
```
### Sensitive view hiding

Use `func uxcamOcclude() -> some View` on a view to hide it from screen recording. By default gestures will not be captured in sensitve views, to capture gestures use  `.uxcamOcclude(blockGestures: false)`  

eg.


```swift
var body: some View  
{  
	VStack
	{
		Text("Personal data: XYZ")  
	 		.uxcamOcclude()  

		Text("Personal data: Gestures seen")  
			.uxcamOcclude(blockGestures: false)
	}
}  
```
 
