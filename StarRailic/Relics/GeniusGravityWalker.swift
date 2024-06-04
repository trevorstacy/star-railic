//
//  GeniusGravityWalker.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct GeniusGravityWalker: Identifiable {
    var id: UUID = UUID()
    var name: String = "Genius's Gravity Walker"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
