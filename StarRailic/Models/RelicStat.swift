//
//  RelicStat.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/19/23.
//

import Foundation

struct RelicStat: Identifiable {
    var id = UUID()
    var stat: Stat
    var mainStat: Bool
    var distribution: Int?
    
    var formattedValue: String {
        let adjustedFormatter = Stat.numberFormatter.copy() as! NumberFormatter

        adjustedFormatter.minimumFractionDigits = !stat.flat ? 1 : 0
        adjustedFormatter.maximumFractionDigits = !stat.flat ? 2 : 0

        let valueAsNSNumber = NSNumber(value: stat.value)
        return adjustedFormatter.string(from: valueAsNSNumber) ?? ""
    }
}
