//
//  ChampionsFleetfootBoots.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct ChampionsFleetfootBoots: Identifiable {
    var id: UUID = UUID()
    var name: String = "Champion's Fleetfoot Boots"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
