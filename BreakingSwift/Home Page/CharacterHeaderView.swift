//
//  CharacterHeaderView.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/31/20.
//

import SwiftUI

struct CharacterHeaderView: View {
    
    var filterModel: FilterModel
    @Binding var searchText: String
    @Binding var season1: Bool
    @Binding var season2: Bool
    @Binding var season3: Bool
    @Binding var season4: Bool
    @Binding var season5: Bool
    
    var body: some View {
        
        VStack (spacing: -4.0) {
            SearchBar(text: $searchText, placeholder: "Search...")
            
            HStack {
                SeasonButton(enabled: $season1, text: "Season 1")
                SeasonButton(enabled: $season2, text: "Season 2")
                SeasonButton(enabled: $season3, text: "Season 3")
                SeasonButton(enabled: $season4, text: "Season 4")
                SeasonButton(enabled: $season5, text: "Season 5")
            }
            .padding(.bottom, 6.0)
        }
    }
}

struct CharacterHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterHeaderView(filterModel: FilterModel(),
                            searchText: .constant("Something"),
                            season1: .constant(true),
                            season2: .constant(false),
                            season3: .constant(false),
                            season4: .constant(false),
                            season5: .constant(false))
    }
}
