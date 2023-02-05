// swift-tools-version: 5.5
import PackageDescription

let package = Package(
  name: "tds-kit",
  platforms: [
    .macOS(.v12),
    .iOS(.v14),
    .watchOS(.v7),
    .tvOS(.v14)
  ],
  products: [
    .library(name: "TDSKit", targets: ["TDSKit"]),
  ],
  targets: [
    .binaryTarget(name: "libsybdb", path: "libsybdb.xcframework"),
    .target(name: "TDSKit", dependencies: ["libsybdb"], publicHeadersPath: "."),
    .testTarget(name: "TDSKitTests", dependencies: ["TDSKit", "libsybdb"]),
  ]
)
