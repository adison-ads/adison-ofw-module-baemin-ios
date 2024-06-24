// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let repoURL = "https://github.com/adison-ads/adison-ofw-module-baemin-ios/releases/download"
let artifactVersion = "1.0.2"
let artifactName = "BaeminOfwModule.zip"
let checksum = "e1a4664aca10b5368d0f786cb90d026c496de3d9f847ab3f5e708d4aa7d34edf"

let offerwallRepoURL = "https://github.com/adison-ads/adison-offerwall-ios-sdk"
let offerwallExactVersion = Version("3.4.10")

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
