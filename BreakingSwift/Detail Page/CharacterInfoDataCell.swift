//
//  CharacterInfoDataCell.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/31/20.
//

import SwiftUI

struct CharacterInfoDataCell: View {
    var title: String
    var value: String
    var body: some View {
        VStack(alignment: .leading, spacing: -2.0) {
            HStack {
                Text(title)
                    .font(.body)
                    .bold()
                Spacer()
            }
            Text(value)
            Divider()
                .padding(.top, 2.0)
        }
        .padding(.bottom, 4.0)
    }
}

struct CharacterInfoDataCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoDataCell(title: "Name:", value: "Walter White")
    }
}
