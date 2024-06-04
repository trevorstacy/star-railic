//
//  WastelandersPoweredGreaves.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct WastelandersPoweredGreaves: Identifiable {
    var id: UUID = UUID()
    var name: String = "Wastelander's Powered Greaves"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
