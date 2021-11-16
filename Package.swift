// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "mssql-client",
  platforms: [
    .macOS(.v11),
    .iOS(.v14),
    .watchOS(.v7),
    .tvOS(.v14)
  ],
  products: [
    .library(name: "MSSQLClient", targets: ["MSSQLClient", "FreeTDS"]),
  ],
  targets: [
    .target(name: "MSSQLClient", publicHeadersPath: "."),
    .binaryTarget(name: "FreeTDS", path: "libsybdb.xcframework")
  ]
)
