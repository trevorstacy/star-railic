//
//  SlandtedRectangleButtonStyle.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/17/23.
//

import SwiftUI

struct SlantedStrokeFillButtonStyle: ButtonStyle {
    var strokeColor: Color
    var fillColor: Color
    var width: CGFloat
    var height: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height)
            .background(
                SlantedRectangle()
                    .stroke(strokeColor, lineWidth: 1)
                    .fill(fillColor)
            )
            .foregroundColor(.white)
    }
}
