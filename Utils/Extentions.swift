//
//  Extentions.swift
//  Touch Memo
//
//  Created by 一折 on 2021/1/9.
//

import Foundation

extension NSPoint {
    func offsetBy(dx:CGFloat, dy: CGFloat) -> NSPoint {
        return NSPoint(x: self.x+dx, y: self.y+dy)
    }
}
