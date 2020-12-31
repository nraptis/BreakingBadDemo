//
//  CharacterCellView.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/30/20.
//

import SwiftUI

struct CharacterCellView: View {
    var characterModel: CharacterModel
    var body: some View {
        HStack {
            CharacterCellImageView(thumbURLString: characterModel.img)
                .padding(.leading, 6.0)
            
            VStack(alignment: .leading, spacing: -2.0) {
                    Text("Name:")
                        .font(.subheadline)
                    Text(characterModel.name)
                        .font(.subheadline)
                        .bold()
            }
            
            .padding(.trailing, 6.0)
            
        
            Spacer()
            
        }
        .padding(.all, 4.0)
    }
}

struct CharacterCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCellView(characterModel: CharacterModel.preview)
    }
}
