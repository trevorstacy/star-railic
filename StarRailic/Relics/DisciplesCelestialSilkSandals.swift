//
//  DisciplesCelestialSilkSandals.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct DisciplesCelestialSilkSandals: Identifiable {
    var id: UUID = UUID()
    var name: String = "Disciple's Celestial Silk Sandals"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
