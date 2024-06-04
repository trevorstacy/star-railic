//
//  EaglesQuiltedPuttees.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct EaglesQuiltedPuttees: Identifiable {
    var id: UUID = UUID()
    var name: String = "Eagle's Quilted Puttees"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
