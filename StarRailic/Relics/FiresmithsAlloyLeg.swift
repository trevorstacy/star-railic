//
//  FiresmithsAlloyLeg.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct FiresmithsAlloyLeg: Identifiable {
    var id: UUID = UUID()
    var name: String = "Firesmith's Alloy Leg"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
