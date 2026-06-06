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
        .binaryTarget(name: "mars", url: "https://github.com/sunsx9316/ANXLog/releases/download/1.0.3/ANXLog.xcframework.zip", checksum: "23bbacb838022cb722aa6da6dae2c21821cab0107abd093c5743464c45606fe3"),
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
