// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApiGames",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        .library(
            name: "ApiGames",
            targets: ["ApiGames"]),
    ],
    dependencies: [
        .package(name: "Realm", url: "https://github.com/realm/realm-cocoa.git", from: "5.4.4"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.2.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "6.0.0"))
    ],
    targets: [
        .target(
            name: "ApiGames",
            dependencies: [
                .product(name: "RealmSwift", package: "Realm"),
                "Alamofire",
                "RxSwift"
            ]),
        .testTarget(
            name: "ApiGamesTests",
            dependencies: ["ApiGames"])
    ]
)
