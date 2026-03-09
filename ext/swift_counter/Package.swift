// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Counter",
    products: [
        .library(
            name: "Counter",
            type: .dynamic,
            targets: ["Counter"]
        ),
    ],
    targets: [
        .target(
            name: "Counter"
        ),
    ]
)
