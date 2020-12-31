//
//  CharacterInfoView.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/31/20.
//

import SwiftUI

struct CharacterInfoView: View {
    var characterModel: CharacterModel
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4.0, content: {
                CharacterInfoDataCell(title: "Name:", value: characterModel.name)
                CharacterInfoDataCell(title: "Occupation:", value: characterModel.formatOccupation())
                CharacterInfoDataCell(title: "Status:", value: characterModel.status)
                CharacterInfoDataCell(title: "NickName:", value: characterModel.nickname)
                CharacterInfoDataCell(title: "Seasons:", value: characterModel.formatSeasons())
            })
        }
    }
}

struct CharacterInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoView(characterModel: CharacterModel.preview)
    }
}
