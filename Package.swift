// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let repoURL = "https://github.com/adison-ads/adison-ofw-module-baemin-ios/releases/download"
let artifactVersion = "0.9.6"
let artifactName = "BaeminOfwModule.zip"
let checksum = "2b6a8a8292a12b1b229852b30805f3221ecd59bf0de67527537b684492d62d46"

let offerwallRepoURL = "https://github.com/adison-ads/adison-offerwall-ios-sdk"
let offerwallExactVersion = Version("3.4.4")

let lottieRepoURL = "https://github.com/airbnb/lottie-spm"
let lottieExactVersion = Version("4.3.4")

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
        .package(
            url: lottieRepoURL, exact: lottieExactVersion
        )
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
