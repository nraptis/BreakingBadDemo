//
//  CharacterModel.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/30/20.
//

import UIKit
import Foundation
import Combine

struct CharacterModel: Decodable {
    let char_id: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let img: String
    let status: String
    let nickname: String
    let appearance: [Int]?
    let portrayed: String
    let category: String
    let better_call_saul_appearance: [Int]
}

extension CharacterModel: Identifiable {
    var id: Int {
        return char_id
    }
}

extension CharacterModel {
    
    func formatOccupation() -> String {
        if occupation.count > 0 {
            var result = ""
            for i in 0..<occupation.count {
                result += occupation[i]
                if i < (occupation.count - 1) {
                    result += ", "
                }
            }
            return result
        } else {
            return "Unknown"
        }
    }
    
    func formatSeasons() -> String {
        if let appearance = appearance, appearance.count > 0 {
            var result = ""
            for i in 0..<appearance.count {
                result += "\(appearance[i])"
                if i < (appearance.count - 1) {
                    result += ", "
                }
            }
            return result
        } else {
            return "Unknown"
        }
    }
}
