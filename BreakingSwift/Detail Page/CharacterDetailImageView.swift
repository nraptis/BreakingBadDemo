//
//  CharacterDetailImageView.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/31/20.
//

import SwiftUI

struct CharacterDetailImageView: View {
    var URLString: String
    var body: some View {
        RemoteImage(url: URLString)
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 200.0, idealWidth: 360.0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 240.0, idealHeight: 260.0, maxHeight: 280.0, alignment: .top)
            .clipShape(Rectangle())
            .shadow(color: Color.black.opacity(0.25), radius: 2, x: -2, y: 2)
    }
    
}

struct CharacterDetailImageView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailImageView(URLString: "")
    }
}
