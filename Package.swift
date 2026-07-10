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
        .binaryTarget(name: "mars", url: "https://github.com/sunsx9316/ANXLog/releases/download/1.0.4/ANXLog.xcframework.zip", checksum: "8d60097ee875b2374aa1e7c06eac59bc86b5191b1fdbb7a5a627d296a5e3e14b"),
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
