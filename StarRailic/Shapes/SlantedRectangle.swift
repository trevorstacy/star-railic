//
//  SlantedRectangle.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/17/23.
//

import SwiftUI

struct SlantedRectangle: Shape {
    var slant: CGFloat = -20.0

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - slant, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX + slant, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}
