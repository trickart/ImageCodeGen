//
//  BarcodeSVGTests.swift
//  
//
//  Created by trickart on 2023/03/25.
//

import Barcode
@testable import BarcodeSVG
import XCTest

final class BarcodeSVGTests: XCTestCase {
    func testGenerate() {
        let svg = BarcodeSVG(barcode: BarcodeStub.code128ZeroOne, height: 40)

        let svgString = """
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 132 50">
        <g>
        <rect x="0" y="0" width="132" height="50" fill="#ffffff"/>
        <rect x="20" y="5" width="4" height="40" fill="#000000"/>
        <rect x="26" y="5" width="2" height="40" fill="#000000"/>
        <rect x="32" y="5" width="6" height="40" fill="#000000"/>
        <rect x="42" y="5" width="4" height="40" fill="#000000"/>
        <rect x="50" y="5" width="4" height="40" fill="#000000"/>
        <rect x="56" y="5" width="4" height="40" fill="#000000"/>
        <rect x="64" y="5" width="2" height="40" fill="#000000"/>
        <rect x="70" y="5" width="2" height="40" fill="#000000"/>
        <rect x="76" y="5" width="4" height="40" fill="#000000"/>
        <rect x="86" y="5" width="4" height="40" fill="#000000"/>
        <rect x="96" y="5" width="6" height="40" fill="#000000"/>
        <rect x="104" y="5" width="2" height="40" fill="#000000"/>
        <rect x="108" y="5" width="4" height="40" fill="#000000"/>
        </g>
        </svg>
        """

        XCTAssertEqual(svg.stringRepresentation, svgString)
    }
}

struct BarcodeStub: Barcode {
    static let code128ZeroOne = BarcodeStub(pattern: [
        Bar(x: 0, width: 4),
        Bar(x: 6, width: 2),
        Bar(x: 12, width: 6),
        Bar(x: 22, width: 4),
        Bar(x: 30, width: 4),
        Bar(x: 36, width: 4),
        Bar(x: 44, width: 2),
        Bar(x: 50, width: 2),
        Bar(x: 56, width: 4),
        Bar(x: 66, width: 4),
        Bar(x: 76, width: 6),
        Bar(x: 84, width: 2),
        Bar(x: 88, width: 4),
    ])

    let pattern: [Bar]
}
