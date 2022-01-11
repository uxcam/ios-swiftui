// swift-tools-version:5.3
import PackageDescription

let version = "0.8.1"

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
		.package(name: "UXCam", url: "https://github.com/uxcam/ios-sdk", from: Version(3, 4, 0, prereleaseIdentifiers: ["beta"]) ),
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
            //path: "./UXCamSwiftUI.xcframework"
			url: "https://github.com/uxcam/ios-swiftui/raw/\(version)/UXCamSwiftUI.xcframework.zip",
			checksum: "25b70c7046286c48ed0b028e84ba42b4f1124bf38e7675c3d9627ab40c6b7b07"
		)
    ]
)
        
