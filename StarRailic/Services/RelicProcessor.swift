//
//  RelicProcessor.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/17/23.
//

import Vision
import SwiftUI

class RelicProcessor {
    func processImageForText(_ image: UIImage, completion: @escaping (String?) -> Void) {
        guard let cgImage = image.cgImage else {
            completion(nil)
            return
        }

        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        let request = VNRecognizeTextRequest { (request, error) in
            if let observations = request.results as? [VNRecognizedTextObservation] {
                var completeText = ""
                
                for observation in observations {
                    if let topResult = observation.topCandidates(1).first {
                        completeText += topResult.string + "\n"
                    }
                }
                
                completion(completeText.trimmingCharacters(in: .whitespaces))
            } else {
                completion(nil)
            }
        }

        do {
            try requestHandler.perform([request])
        } catch {
            print("Error performing text recognition: \(error)")
            completion(nil)
        }
    }
    
    func getDataFromText(_ text: String, completion: @escaping (Relic?) -> Void) {
        let parsedText = text.replacingOccurrences(of: "• ", with: "").replacingOccurrences(of: "‡ ", with: "")
        
        guard let (relicName, updatedText) = getRelicName(parsedText) else {
            completion(nil)
            return
        }
        
        guard let (relicType, updatedText) = getRelicType(updatedText) else {
            completion(nil)
            return
        }

        guard let (level, updatedText) = getRelicLevel(updatedText) else {
            completion(nil)
            return
        }
        
        guard let relicLevel = level else {
            completion(nil)
            return
        }
        
        guard let relicStats = getRelicStats(updatedText) else {
            completion(nil)
            return
        }

        if relicStats.count <= 2 && relicLevel > 3 {
            completion(nil)
            return
        }

        let relic = Relic(name: relicName, type: relicType, level: relicLevel, stats: relicStats)
        
        completion(relic)
    }
    
    func getRelicName(_ text: String) -> (name: String, updatedText: String)? {
        let foundName = relicPieces.filter { text.contains($0) }

        guard let relicName = foundName.first else {
            return nil
        }
        
        let updatedText = text.replacingOccurrences(of: relicName, with: "", options: .literal).trimmingCharacters(in: .whitespaces)
        
        return (relicName, updatedText)
    }
    
    func getRelicType(_ text: String) -> (relicType: String, updatedText: String)? {
        let foundType = relicTypes.filter { text.contains($0) }
        
        guard let relicType = foundType.first else {
            return nil
        }
        
        let updatedText = text.replacingOccurrences(of: relicType, with: "", options: .literal).trimmingCharacters(in: .whitespaces)
        
        return (relicType, updatedText)
    }
    
    func getRelicLevel(_ text: String) -> (level: Int?, updatedText: String)? {
        let pattern = "\\+\\s+\\d+"
        
        if let range = text.range(of: pattern, options: .regularExpression) {
            let matchedString = String(text[range])
            let updatedText = text.replacingOccurrences(of: matchedString, with: "", options: .literal).trimmingCharacters(in: .whitespaces)
            let level = Int(matchedString.replacingOccurrences(of: "+ ", with: ""))
            
            return (level, updatedText)
        }
        
        return (nil, text)
    }
    
    func getRelicStats(_ text: String) -> [RelicStat]? {
        let relicScorer = RelicScorer()
        let array = text.split(separator: "\n")
        let midpoint = array.count / 2
        let keys = array[0..<midpoint].map { String($0) }
        let values = array[midpoint..<array.count].map { String($0) }

        var result = [RelicStat]()
        
        for (index, (key, value)) in zip(keys, values).enumerated() {
            let statName = value.contains("%") ? "\(key)%" : key
            let statValue = Double(value.replacingOccurrences(of: "%", with: ""))
            
            if (statValue == nil) {
                return nil
            }
            
            let stat = Stat(name: key, value: statValue!, flat: value.contains("%") ? false : true)
            let distribution = relicScorer.getStatDistribution(stat: statName, value: statValue!, rarity: "5-Star")
            let relicStat = RelicStat(
                stat: stat,
                mainStat: index == 0,
                distribution: distribution == nil ? nil : distribution!
            )
            
            result.append(relicStat)
        }
        
        if result.isEmpty {
            return nil
        } else {
            return result
        }
    }
}
