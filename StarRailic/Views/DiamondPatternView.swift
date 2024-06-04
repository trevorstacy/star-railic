//
//  DiamondPatternView.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/16/23.
//

import SwiftUI

struct DiamondPatternView: View {
    let diamondSize: CGFloat = 5
    let spacing: CGFloat = 6

    var rows: Int {
        Int(UIScreen.main.bounds.height / spacing) + 100
    }
    
    var columns: Int {
        Int(UIScreen.main.bounds.width / spacing) + 3
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            ForEach(0..<rows) { row in
                ForEach(0..<columns) { col in
                    Diamond()
                        .fill(.white)
                        .opacity(0.025)
                        .frame(width: diamondSize, height: diamondSize)
                        .offset(
                            x: CGFloat(col) * spacing + (row % 2 == 1 ? spacing / 2 : 0) - UIScreen.main.bounds.width / 2,
                            y: (CGFloat(row) * spacing * 0.75 - UIScreen.main.bounds.height / 2) - 20
                        )
                }
            }
        }
    }
}

#Preview {
    DiamondPatternView()
}
