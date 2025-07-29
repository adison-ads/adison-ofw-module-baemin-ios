// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let repoURL = "https://github.com/adison-ads/adison-ofw-module-baemin-ios/releases/download"
let artifactVersion = "1.5.2"
let artifactName = "BaeminOfwModule.zip"
let checksum = "95a0a422f86e460ed00548acb29d8d639e40bfc49bba449ed195dc4c4c48f2dd"

let offerwallRepoURL = "https://github.com/adison-ads/adison-offerwall-ios-sdk"
let offerwallExactVersion = Version("3.14.2")

let lottieRepoURL = "https://github.com/airbnb/lottie-spm"
let lottieMinVersion = Version("4.3.4")

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
        .package(url: lottieRepoURL, from: lottieMinVersion)
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
                .product(name: "AdisonOfferwallSDK", package: "adison-offerwall-ios-sdk"),
                .product(name: "Lottie", package: "lottie-spm")
            ],
            path: "Sources"
        )
    ]
)
