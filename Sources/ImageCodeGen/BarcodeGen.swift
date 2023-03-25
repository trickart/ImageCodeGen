//
//  BarcodeGen.swift
//  
//
//  Created by trickart on 2023/03/26.
//

import Barcode
import Code128
import Foundation

enum BarcodeType {
    case code128
}

enum BarcodeGen {
    static func generate(content: String, type: BarcodeType) -> Barcode? {
        switch type {
        case .code128:
            return Code128(content: content)
        }
    }
}
