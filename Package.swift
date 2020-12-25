// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "SettingsViewController",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "SettingsViewController",
                 targets: ["SettingsViewController"]),
    ],
    dependencies: [
        .package(name: "SnapKit",
                 url: "https://github.com/snapkit/snapkit.git",
                 .upToNextMinor(from:"5.0.1")),
    ],
    targets: [
        .target(name: "SettingsViewController",
                dependencies: ["SnapKit"])
    ]
)
