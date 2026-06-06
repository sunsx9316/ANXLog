// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ANXLog",
    platforms: [.iOS(.v12), .macOS(.v11), .tvOS(.v12)],
    products: [
        .library(
            name: "ANXLog",
            type: .dynamic,
            targets: ["ANXLog"]),
    ],
    targets: [
        .binaryTarget(name: "mars", path: "ANXLog/Resources/ANXLog.xcframework"),
        .target(
            name: "ANXLog",
            dependencies: [
                .target(name: "mars", condition: .when(platforms: [.iOS, .macOS, .tvOS]))
            ],
            path: "ANXLog/Classes/Objc",
            publicHeadersPath: "include",
            linkerSettings: [.linkedFramework("Foundation"),
                             .linkedFramework("SystemConfiguration"),
                             .linkedLibrary("resolv.9"), .linkedLibrary("z")]),
    ]
)
