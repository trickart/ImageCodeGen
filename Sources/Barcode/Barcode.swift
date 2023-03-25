//
//  Barcode.swift
//  
//
//  Created by trickart on 2023/03/25.
//

import Foundation

public protocol Barcode {
    var pattern: [Bar] { get }
}

public let BarcodeQuietZoneWidth: Int = 20
public let BarcodeHeightMargin: Int = 5

public struct Bar {
    public let x: Int
    public let width: Int

    public init(x: Int, width: Int) {
        self.x = x
        self.width = width
    }
}
