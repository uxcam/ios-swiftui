// swift-tools-version:5.3
import PackageDescription

let version = "1.0.4"

let package = Package(
    
    name: "UXCamSwiftUI",
    
    platforms: 
    [
        .iOS(.v13)
    ],
    
    products: 
    [
        .library(
			name: "UXCamSwiftUI",
            targets: ["UXCamSwiftUI", "UXCamSwiftUIWrapper"]
		)
    ],
	
	dependencies:
	[
		.package(name: "UXCam", url: "https://github.com/uxcam/ios-sdk", from: Version(3, 6, 2)),
	],
	
    targets: 
    [
		// 'UXCamSwiftUIWrapper' target is a way to include the necessary dependency that the binary XCFramework in UXCamSwiftUI requires.
		// See https://forums.swift.org/t/swiftpm-binary-target-with-sub-dependencies/40197/13 for a long thread on the deficiencies of the `binaryTarget`
		.target(
				name: "UXCamSwiftUIWrapper",
				dependencies: ["UXCam"],
				path: "UXCamSwiftUIWrapper",
				exclude: ["README.md"]
		),
        .binaryTarget(
            name: "UXCamSwiftUI",
			url: "https://github.com/uxcam/ios-swiftui/raw/\(version)/UXCamSwiftUI.xcframework.zip",
			checksum: "d499e2255c399c9a57174d4c3995a7c49e4967208999f0844cbad79ccef86a12"
		)
    ]
)
        
