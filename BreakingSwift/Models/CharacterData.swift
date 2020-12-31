//
//  CharacterData.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/30/20.
//

import Foundation

class CharacterData: ObservableObject {
    var modelList = [CharacterModel]()
    public init(modelList: [CharacterModel]) {
        self.modelList = modelList
    }
}
