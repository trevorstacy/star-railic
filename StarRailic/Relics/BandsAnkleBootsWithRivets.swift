//
//  BandsAnkleBootsWithRivets.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct BandsAnkleBootsWithRivets: Identifiable {
    var id: UUID = UUID()
    var name: String = "Band's Ankle Boots With Rivets"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
