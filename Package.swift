// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let repoURL = "https://github.com/adison-ads/adison-ofw-module-baemin-ios/releases/download"
let artifactVersion = "0.9.0-beta1"
let artifactName = "BaeminOfwModule.zip"
let checksum = ""

let offerwallRepoURL = "https://github.com/adison-ads/adison-offerwall-ios-sdk"
let offerwallExactVersion = Version("3.4.0-beta1")

// MARK: - Do not change.
let package = Package(
    name: "BaeminOfwModule",
    products: [
        .library(
            name: "BaeminOfwModule",
            targets: ["BaeminOfwModule", "BaeminOfwModuleTarget"]
        ),
    ],
    dependencies: [
        .package(
            url: offerwallRepoURL, exact: offerwallExactVersion
        ),
    ],
    targets: [
        .binaryTarget(
            name: "BaeminOfwModule",
            url: repoURL + "/" + artifactVersion + "/" + artifactName,
            checksum: checksum
        ),
        .target(
            name: "BaeminOfwModuleTarget",
            dependencies: [
                .product(name: "AdisonOfferwallSDK", package: "adison-offerwall-ios-sdk")
            ],
            path: "Sources"
        )
    ]
)
