//
//  BarcodeSVG.swift
//  
//
//  Created by trickart on 2023/03/21.
//

import Barcode
import Foundation

protocol SVGNode {
    var stringRepresentation: String { get }
}

struct BarcodeSVG: SVGNode {
    let svgElement: SVGElement

    var stringRepresentation: String {
        let string = """
            <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
            <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
            \(svgElement.stringRepresentation)
            """
        return string
    }

    init(barcode: Barcode, height: Int) {
        svgElement = SVGElement(barcode: barcode, height: height)
    }
}

struct SVGElement: SVGNode {
    let group: GroupElement

    var stringRepresentation: String {
        guard let lastRect = group.rectangles.last else { fatalError() }
        let heightWithMargin = lastRect.height + BarcodeHeightMargin * 2
        let viewBox = "0 0 \(Self.widthWithQuietZone(lastRect: lastRect)) \(heightWithMargin)"

        return "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" viewBox=\"\(viewBox)\">\n\(group.stringRepresentation)\n</svg>"
    }

    static func widthWithQuietZone(lastRect: RectangleElement) -> Int {
        return lastRect.x + lastRect.width + BarcodeQuietZoneWidth
    }
}

extension SVGElement {
    init(barcode: Barcode, height: Int) {
        group = GroupElement(barcode: barcode, height: height)
    }
}

struct GroupElement: SVGNode {
    let rectangles: [RectangleElement]

    var stringRepresentation: String {
        let rects = rectangles.map(\.stringRepresentation).joined(separator: "\n")
        return "<g>\n\(rects)\n</g>"
    }
}

extension GroupElement {
    init(barcode: Barcode, height: Int) {
        let bars = barcode.pattern.map {
            RectangleElement(x: $0.x + BarcodeQuietZoneWidth,
                             y: BarcodeHeightMargin, width: $0.width, height: height, fill: "#000000")
        }

        guard let lastRect = bars.last else { fatalError("empty pattern.") }
        let heightWithMargin = height + BarcodeHeightMargin * 2
        let background = RectangleElement(x: 0, y: 0,
                                          width: SVGElement.widthWithQuietZone(lastRect: lastRect),
                                          height: heightWithMargin,
                                          fill: "#ffffff")

        rectangles = [background] + bars
    }
}

struct RectangleElement: SVGNode {
    let x: Int
    let y: Int
    let width: Int
    let height: Int
    let fill: String

    var stringRepresentation: String {
        "<rect x=\"\(x)\" y=\"\(y)\" width=\"\(width)\" height=\"\(height)\" fill=\"\(fill)\"/>"
    }
}
