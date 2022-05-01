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
    .binaryTarget(name: "libsybdb", path: "libsybdb.xcframework"),
    .target(name: "MSSQLClient", dependencies: ["libsybdb"], publicHeadersPath: "."),
    .testTarget(name: "MSSQLClientTests", dependencies: ["MSSQLClient", "libsybdb"]),
  ]
)
