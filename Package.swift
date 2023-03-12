// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PushNotification",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LocalPushNotification",
            targets: ["LocalPushNotificationTarget"]),
        .library(name: "APNSPushNotification", targets: ["APNSPushNotificationTarget"]),
        .library(name: "FirebasePushNotification", targets: ["FirebasePushNotificationTarget"])
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "10.4.0"))
    ],
    targets: [
        .target(
            name: "LocalPushNotificationTarget",
            dependencies: [],
            path: "Sources/LocalPushNotificationTarget"),
        .target(name: "FirebasePushNotificationTarget",
               dependencies: [
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk")
               ],
               path: "Sources/FirebasePushNotificationTarget"),
        .target(name: "APNSPushNotificationTarget",
               dependencies: [],
               path: "Sources/APNSPushNotificationTarget"),
    ]
)
