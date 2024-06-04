//
//  MusketeersRivetsRidingBoots.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct MusketeersRivetsRidingBoots: Identifiable {
    var id: UUID = UUID()
    var name: String = "Musketeer's Rivets Riding Boots"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
