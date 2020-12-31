//
//  BreakingBadRoot.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/29/20.
//

import SwiftUI

struct BreakingBadRoot: View {
    
    private let service = BreakingBadService()
    @State var characterData = CharacterData(modelList: [])
    
    var body: some View {
        VStack {
            CharacterScrollView(characterData: characterData,
                                searchText: "",
                                season1: true,
                                season2: true,
                                season3: true,
                                season4: true,
                                season5: true)
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        service.makeRequest() { result in
            switch result {
            case .success(let characterData):
                self.characterData = characterData
            case .failure:
                self.characterData = CharacterData(modelList: [])
            }
        }
    }
}

struct BreakingBadRoot_Previews: PreviewProvider {
    static var previews: some View {
        BreakingBadRoot(characterData: CharacterData.preview)
    }
}
