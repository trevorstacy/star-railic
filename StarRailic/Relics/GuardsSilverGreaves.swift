//
//  GuardsSilverGreaves.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct GuardsSilverGreaves: Identifiable {
    var id: UUID = UUID()
    var name: String = "Guard's Silver Greaves"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
