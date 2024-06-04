//
//  PasserbysStygianHikingBoots.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct PasserbysStygianHikingBoots: Identifiable {
    var id: UUID = UUID()
    var name: String = "Passerby's Stygian Hiking Boots"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
