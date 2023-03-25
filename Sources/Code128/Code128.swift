//
//  Code128.swift
//  
//
//  Created by trickart on 2023/01/31.
//

import Barcode
import Foundation

public struct Code128 {
    public enum Start: Int {
        // CodeA is not implemented
        //case a = 103
        case b = 104
        case c = 105
    }

    public let start: Start
    public let content: String

    var contentValues: [Int] {
        switch start {
        case .b:
            return content.compactMap { CodeB[$0] }
        case .c:
            // e.g. "01234"
            let characters = content.map { $0 } // => ["0", "1", "2", "3", "4", "5"]
            return stride(from: 0, to: characters.count, by: 2) // => 0, 2, 4
                .compactMap { Int(String(characters[$0...$0 + 1])) } // => [01, 23, 45]
        }
    }

    var bitPattern: [Bool] {
        let values = [start.rawValue] + content.compactMap { CodeB[$0] } + [checkDigit]
        return values.flatMap { BitPatterns[$0] }
    }

    var checkDigit: Int {
        Code128.calculateCheckDigit(start: start, contentValues: content.compactMap { CodeB[$0] })
    }

    /// Calculate weighted modulo-103
    static func calculateCheckDigit(start: Start, contentValues: [Int]) -> Int {
        let weightedValues = contentValues.enumerated().map { $0.element * ($0.offset + 1) }

        let weighted = [start.rawValue] + weightedValues
        let sum = weighted.reduce(0, +)

        return sum % 103
    }
}

extension Code128 {
    public init?(content: String) {
        guard !content.isEmpty else { return nil }

        let characters = content.map { $0 }

        let isASCIIOnly = characters.allSatisfy(\.isASCII)
        guard isASCIIOnly else { return nil }

        let isNumberOnly = characters.allSatisfy(\.isNumber)
        let isEven = characters.count % 2 == 0

        self.start = (isNumberOnly && isEven) ? .c : .b
        self.content = content
    }
}

extension Code128: Barcode {
    public var pattern: [Bar] {
        var bars: [Bar] = []
        var x: Int = 0
        var length = 0

        for (index, isBlack) in bitPattern.enumerated() {
            if isBlack {
                if length == 0 {
                    x = index * 2
                }
                length += 2
            } else {
                guard length > 0 else { continue }
                bars.append(Bar(x: x, width: length))
            }
        }
        return bars
    }
}
