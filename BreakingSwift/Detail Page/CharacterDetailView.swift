//
//  CharacterDetailView.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/31/20.
//

import SwiftUI

struct CharacterDetailView: View {
    var characterModel: CharacterModel
    var body: some View {
        ScrollView {
            CharacterDetailImageView(URLString: characterModel.img)
            CharacterInfoView(characterModel: characterModel)
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(characterModel: CharacterModel.preview)
    }
}
