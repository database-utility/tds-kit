// swift-tools-version:5.5
import PackageDescription

let package = Package(
  name: "mssql-client",
  platforms: [
    .macOS(.v12),
    .iOS(.v14),
    .watchOS(.v7),
    .tvOS(.v14)
  ],
  products: [
    .library(name: "MSSQLClient", targets: ["MSSQLClient"]),
  ],
  targets: [
    .binaryTarget(name: "FreeTDS", path: "libsybdb.xcframework"),
    .target(name: "MSSQLClient", dependencies: ["FreeTDS"], publicHeadersPath: "."),
    .testTarget(name: "MSSQLClientTests", dependencies: ["MSSQLClient", "FreeTDS"]),
  ]
)
