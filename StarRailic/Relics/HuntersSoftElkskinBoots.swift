//
//  HuntersSoftElkskinBoots.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct HuntersSoftElkskinBoots: Identifiable {
    var id: UUID = UUID()
    var name: String = "Hunter's Soft Elkskin Boots"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
