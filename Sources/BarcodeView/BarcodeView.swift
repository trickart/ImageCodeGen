//
//  BarcodeView.swift
//  
//
//  Created by trickart on 2023/03/25.
//

import Barcode
import SwiftUI

struct BarcodeView: View {
    let barcode: Barcode
    let height: CGFloat
    let scale: CGFloat

    var body: some View {
        Path { path in
            barcode.pattern.forEach { bar in
                path.addRect(CGRect(x: CGFloat(bar.x) * scale,
                                    y: 0,
                                    width: CGFloat(bar.width) * scale,
                                    height: CGFloat(height) * scale))
            }
        }
        .frame(width: barcode.width * scale, height: height * scale)
        .padding(.horizontal, CGFloat(BarcodeQuietZoneWidth) * scale)
        .padding(.vertical, CGFloat(BarcodeHeightMargin) * scale)
        .background(Color.white)
    }

    init(barcode: Barcode, height: CGFloat = 40, scale : CGFloat = 1) {
        self.barcode = barcode
        self.height = height
        self.scale = scale
    }
}

struct BarcodeView_Previews: PreviewProvider {
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

    static var previews: some View {
        VStack(spacing: .zero) {
            BarcodeView(barcode: BarcodeStub.code128ZeroOne)
            BarcodeView(barcode: BarcodeStub.code128ZeroOne, scale: 1.5)
            BarcodeView(barcode: BarcodeStub.code128ZeroOne, scale: 2)
        }
        .background(Color.gray)
    }
}

extension Barcode {
    var width: CGFloat {
        guard let lastBar = pattern.last else { return .zero }
        return CGFloat(lastBar.x + lastBar.width)
    }
}
