// swift-tools-version:5.3
import PackageDescription

let version = "0.1.0"

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
            targets: ["UXCamSwiftUI"]
		)
    ],
	dependencies: [
			  .package(url: "https://github.com/uxcam/ios-sdk", from: "3.3.7"),
		 ],
    targets: 
    [
        .binaryTarget(
            name: "UXCamSwiftUI",
            //path: "./UXCamSwiftUI.xcframework"
			//url: "https://github.com/uxcam/ios-swiftui/UXCamSwiftUI.xcframework.zip",
			url: "https://raw.githubusercontent.com/uxcam/ios-swiftui/\(version)/UXCamSwiftUI.xcframework.zip",
			checksum: "f82719799ed6abdb7451e1b5bd6f4def5340b89ec4d385418291a7e5cd702c36"
		)
    ]
)
        
