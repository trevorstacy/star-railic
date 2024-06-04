//
//  RelicScorer.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/19/23.
//

import Foundation

struct StatDistribution: Decodable {
    let Stat: String
    let fiveStar: String
    let fourStar: String
    let threeStar: String
    let twoStar: String
    
    private enum CodingKeys: String, CodingKey {
        case Stat
        case fiveStar = "5-Star"
        case fourStar = "4-Star"
        case threeStar = "3-Star"
        case twoStar = "2-Star"
    }
}

let jsonData = """
[
    {
        "Stat": "SPD",
        "5-Star": "2/2.3/2.6",
        "4-Star": "1.6/1.8/2",
        "3-Star": "1.2/1.3/1.4",
        "2-Star": "1/1.1/1.2"
    },
    {
        "Stat": "HP",
        "5-Star": "33.87/38.103755/42.33751",
        "4-Star": "27.096/30.483/33.87",
        "3-Star": "20.322/22.862253/25.402506",
        "2-Star": "13.548/15.2415/16.935"
    },
    {
        "Stat": "ATK",
        "5-Star": "16.935/19.051877/21.168754",
        "4-Star": "13.548/15.2415/16.935",
        "3-Star": "10.161/11.431126/12.701252",
        "2-Star": "6.774/7.62075/8.4675"
    },
    {
        "Stat": "DEF",
        "5-Star": "16.935/19.051877/21.168754",
        "4-Star": "13.548/15.2415/16.935",
        "3-Star": "10.161/11.431126/12.701252",
        "2-Star": "6.774/7.62075/8.4675"
    },
    {
        "Stat": "HP%",
        "5-Star": "3.456%/3.888%/4.32%",
        "4-Star": "2.7648%/3.1104%/3.456%",
        "3-Star": "2.0736%/2.3328%/2.592%",
        "2-Star": "1.3824%/1.5552%/1.728%"
    },
    {
        "Stat": "ATK%",
        "5-Star": "3.456%/3.888%/4.32%",
        "4-Star": "2.7648%/3.1104%/3.456%",
        "3-Star": "2.0736%/2.3328%/2.592%",
        "2-Star": "1.3824%/1.5552%/1.728%"
    },
    {
        "Stat": "DEF%",
        "5-Star": "4.32%/4.86%/5.4%",
        "4-Star": "3.456%/3.888% 4.32%",
        "3-Star": "2.592%/2.916%/3.24%",
        "2-Star": "1.728%/1.944%/2.16%"
    },
    {
        "Stat": "Break Effect%",
        "5-Star": "5.184%/5.832%/6.48%",
        "4-Star": "4.1472%/4.6656%/5.184%",
        "3-Star": "3.1104%/3.4992%/3.888%",
        "2-Star": "2.0736%/2.3328%/2.592%"
    },
    {
        "Stat": "Effect Hit Rate%",
        "5-Star": "3.456%/3.888%/4.32%",
        "4-Star": "2.7648%/3.1104%/3.456%",
        "3-Star": "2.0736%/2.3328%/2.592%",
        "2-Star": "1.3824%/1.5552%/1.728%"
    },
    {
        "Stat": "Effect RES%",
        "5-Star": "3.456%/3.888%/4.32%",
        "4-Star": "2.7648%/3.1104%/3.456%",
        "3-Star": "2.0736%/2.3328%/2.592%",
        "2-Star": "1.3824%/1.5552%/1.728%"
    },
    {
        "Stat": "CRIT Rate%",
        "5-Star": "2.592%/2.916%/3.24%",
        "4-Star": "2.0736%/2.3328%/2.592%",
        "3-Star": "1.5552%/1.7496%/1.944%",
        "2-Star": "1.0368%/1.1664%/1.296%"
    },
    {
        "Stat": "CRIT DMG%",
        "5-Star": "5.184%/5.832%/6.48%",
        "4-Star": "4.1472%/4.6656%/5.184%",
        "3-Star": "3.1104%/3.4992%/3.888%",
        "2-Star": "2.0736%/2.3328%/2.592%"
    }
]
""".data(using: .utf8)!

class RelicScorer {
    func getStatDistribution(stat: String, value: Double, rarity: String) -> Int? {
        let decoder = JSONDecoder()
        let data: [StatDistribution] = try! decoder.decode([StatDistribution].self, from: jsonData)

        guard let statData = data.first(where: { $0.Stat == stat }) else {
            return nil
        }
        
        var valuesString = ""
        switch rarity {
        case "5-Star":
            valuesString = statData.fiveStar
        case "4-Star":
            valuesString = statData.fourStar
        case "3-Star":
            valuesString = statData.threeStar
        case "2-Star":
            valuesString = statData.twoStar
        default:
            return nil
        }
        
        let values = valuesString.split(separator: "/").map { Double($0.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "%", with: "")) }

        guard let baseValue = values.first else {
            return nil
        }
        
        return Int(round(value / baseValue!))
    }
}
