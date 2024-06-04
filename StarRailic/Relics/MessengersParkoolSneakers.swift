//
//  MessengersParkoolSneakers.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/20/23.
//

import Foundation

struct MessengersParkoolSneakers: Identifiable {
    var id: UUID = UUID()
    var name: String = "Messenger's Par-kool Sneakers"
    var type: RelicType = .feet
    var availableMainStats: [StatEnum] = [.HPPercent, .ATKPercent, .DEFPercent, .SPD]
}
