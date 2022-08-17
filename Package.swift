// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLint",
    products: [
        .plugin(name: "SwiftLintTool", targets: ["SwiftLintBuildTool"]),
        .library(name: "SwiftLint", targets: ["SwiftLint"])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SwiftLintBinary",
            url: "https://github.com/realm/SwiftLint/releases/download/0.48.0/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "9c255e797260054296f9e4e4cd7e1339a15093d75f7c4227b9568d63edddba50"
        ),
        .plugin(name: "SwiftLintBuildTool", capability: .buildTool(), dependencies: ["SwiftLintBinary"]),
        .target(name: "SwiftLint")
    ]
)
