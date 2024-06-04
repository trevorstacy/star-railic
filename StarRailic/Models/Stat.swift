//
//  Stat.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/17/23.
//

import Foundation

struct Stat {
    var name: String
    var value: Double
    var flat: Bool
    
    static let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.alwaysShowsDecimalSeparator = false
        numberFormatter.minimumFractionDigits = 1
        numberFormatter.maximumFractionDigits = 1
        
        return numberFormatter
    }()
}
