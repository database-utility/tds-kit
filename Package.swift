// swift-tools-version:5.5
import PackageDescription

let package = Package(
  name: "MSSQLClient",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(name: "MSSQLClient", targets: ["MSSQLClient", "FreeTDS"]),
//    .library(name: "MSSQLClient", targets: ["MSSQLClient"]),
  ],
  targets: [
    .target(name: "MSSQLClient", publicHeadersPath: "."),
    .binaryTarget(name: "FreeTDS", path: "libsybdb.xcframework")
  ]
)

//let package = Package(
//  name: "MSSQLClient",
//  platforms: [
//    .iOS(.v15)
//  ],
//  products: [
//    .library(
//      name: "MSSQLClient",
//      targets: ["MSSQLClient"]),
//    .library(
//      name: "MSSQLClientObjC",
//      targets: ["MSSQLClientObjC"])
//  ],
//  targets: [
//    .target(name: "MSSQLClientObjC",
//            publicHeadersPath: "."),
//    .target(name: "MSSQLClient",
//            dependencies: ["MSSQLClientObjC"]),
//  ]
//)
