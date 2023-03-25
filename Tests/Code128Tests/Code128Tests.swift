//
//  Code128Tests.swift
//  
//
//  Created by trickart on 2023/01/31.
//

@testable import Code128
import XCTest

final class Code128Tests: XCTestCase {
    func testInit() {
        XCTContext.runActivity(named: "failable init") { _ in
            XCTAssertNil(Code128(content: ""))
            XCTAssertNil(Code128(content: "漢字"))
            XCTAssertNotNil(Code128(content: "0123456789"))
            XCTAssertNotNil(Code128(content: "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
            XCTAssertNotNil(Code128(content: "abcdefghijklmnopqrstuvwxyz"))
            XCTAssertNotNil(Code128(content: " !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}"))
        }

        XCTContext.runActivity(named: "StartCode") { _ in
            XCTAssertEqual(Code128(content: "ACB")?.start, .b)
            XCTAssertEqual(Code128(content: "abc")?.start, .b)
            XCTAssertEqual(Code128(content: "!?")?.start, .b)
            XCTAssertEqual(Code128(content: "0")?.start, .b)
            XCTAssertEqual(Code128(content: "01")?.start, .c)
            XCTAssertEqual(Code128(content: "0123456789")?.start, .c)
        }
    }

    func testCalculateCheckDigit() {
        // [Start C] [FNC1] 42 18 40 20 50 [Code A] 16 [Check symbol 92] [Stop]
        let values = [102, 42, 18, 40, 20, 50, 101, 16]

        XCTAssertEqual(Code128.calculateCheckDigit(start: .c, contentValues: values), 92)
    }
}
