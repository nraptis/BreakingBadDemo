//
//  CharacterCellImageView.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/30/20.
//

import SwiftUI

struct CharacterCellImageView: View {
    var thumbURLString: String
    var body: some View {
        RemoteImage(url: thumbURLString)
            .aspectRatio(contentMode: .fill)
            .frame(width: 78.0 * 0.56, height: 110.0 * 0.56, alignment: .top)
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
            .shadow(color: Color.black.opacity(0.25), radius: 2, x: -2, y: 2)
    }
    
}

struct CharacterCellImageView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCellImageView(thumbURLString: "")
    }
}
