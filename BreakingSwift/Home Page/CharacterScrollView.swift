//
//  CharacterScrollView.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/30/20.
//

import SwiftUI
import Combine

struct CharacterScrollView: View {
    
    var filterModel = FilterModel()
    var characterData: CharacterData
    
    @State var searchText: String
    @State var season1: Bool
    @State var season2: Bool
    @State var season3: Bool
    @State var season4: Bool
    @State var season5: Bool
    
    var body: some View {
        NavigationView{
            List {
                Section(
                    header: CharacterHeaderView(filterModel: filterModel,
                                            searchText: $searchText,
                                            season1: $season1,
                                            season2: $season2,
                                            season3: $season3,
                                            season4: $season4,
                                            season5: $season5)
                ) {
                    ForEach (filterModel.filterCharacterData(characterData,
                                                             searchText: searchText,
                                                             includeSeason1: season1,
                                                             includeSeason2: season2,
                                                             includeSeason3: season3,
                                                             includeSeason4: season4,
                                                             includeSeason5: season5
                    )) { characterModel in
                        NavigationLink(destination:CharacterDetailView(characterModel: characterModel)) {
                                CharacterCellView(characterModel: characterModel)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
        }
    }
}

struct CharacterScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterScrollView(characterData: CharacterData.preview,
                            searchText: "",
                            season1: false,
                            season2: true,
                            season3: false,
                            season4: false,
                            season5: false)
    }
}
