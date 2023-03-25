// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "ImageCodeGen",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "BarcodeView",
            targets: [
                "Barcode", "BarcodeView",
            ]),
        .library(
            name: "ImageCodeGen",
            targets: ["ImageCodeGen"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(name: "Barcode"),
        .target(name: "BarcodeSVG",
                dependencies: ["Barcode"]),
        .target(name: "BarcodeView", dependencies: ["Barcode"]),
        .target(name: "Code128",
                dependencies: ["Barcode"]),
        .target(
            name: "ImageCodeGen",
            dependencies: [
                "Code128",
                "BarcodeSVG",
            ]),
        .testTarget(
            name: "BarcodeSVGTests",
            dependencies: [
                "Barcode",
                "BarcodeSVG",
            ]),
        .testTarget(name: "Code128Tests",
                    dependencies: ["Code128"]),
    ]
)
