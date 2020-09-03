// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Tools",
    platforms: [.macOS(.v11)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-format.git", .branch("master")),
    ]
)
