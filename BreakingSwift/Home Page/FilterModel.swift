//
//  FilterModel.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/31/20.
//

import Foundation
import SwiftUI

class FilterModel {
    
    func filterCharacterData(_ data: CharacterData,
                             searchText: String,
                             includeSeason1: Bool,
                             includeSeason2: Bool,
                             includeSeason3: Bool,
                             includeSeason4: Bool,
                             includeSeason5: Bool
    ) -> [CharacterModel] {
        
        var seasonMatchSet = Set<Int>()
        
        if  includeSeason1 == true &&
            includeSeason2 == true &&
            includeSeason3 == true &&
            includeSeason4 == true &&
            includeSeason5 == true {
            for model in data.modelList {
                seasonMatchSet.insert(model.char_id)
            }
        } else {
            
            for model in data.modelList {
                
                var seasonMatch = false
                if let appearance = model.appearance {
                    for season in appearance {
                        if season == 1 && includeSeason1 == true {
                            seasonMatch = true
                        }
                        if season == 2 && includeSeason2 == true {
                            seasonMatch = true
                        }
                        if season == 3 && includeSeason3 == true {
                            seasonMatch = true
                        }
                        if season == 4 && includeSeason4 == true {
                            seasonMatch = true
                        }
                        if season == 5 && includeSeason5 == true {
                            seasonMatch = true
                        }
                    }
                }
                if seasonMatch {
                    seasonMatchSet.insert(model.char_id)
                }
            }
        }
        
        var result = [CharacterModel]()
        
        if searchText.isEmpty {
            for model in data.modelList {
                if seasonMatchSet.contains(model.char_id) {
                    result.append(model)
                }
            }
        } else {
            for model in data.modelList {
                if seasonMatchSet.contains(model.char_id) {
                    if model.name.lowercased().contains(searchText.lowercased()) {
                        result.append(model)
                    }
                }
            }
        }
        
        return result
    }
}
