// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "Counter",
    products: [
        .library(
            name: "Counter",
            type: .dynamic,
            targets: ["Counter"],
        ),
    ],
    targets: [
        .target(
            name: "Counter",
            dependencies: ["CounterShim"],
        ),
        .target(
            name: "CounterShim",
        )
    ]
)
