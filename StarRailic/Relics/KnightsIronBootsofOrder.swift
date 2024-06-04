//
//  KnightsIronBootsofOrder.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct KnightsIronBootsofOrder: Identifiable {
    var id: UUID = UUID()
    var name: String = "Knight's Iron Boots of Order"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
