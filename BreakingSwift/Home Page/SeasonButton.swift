//
//  SeasonButton.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/31/20.
//

import SwiftUI

struct SeasonButton: View {
    @Binding var enabled: Bool
    let text: String
    var body: some View {
        Button(action: {
            enabled.toggle()
        }, label: {
            VStack {
                Text(text)
                    .bold()
                    .font(.caption2)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(
                        enabled ? Color.white : Color.gray
                    )
                Image(systemName: enabled ? "checkmark.square.fill" : "xmark.square.fill")
                    .foregroundColor(enabled ? Color.white : Color.gray)
                
            }.padding(.all, 6.0)
        })
        .background(enabled ? Color.blue : Color.init(Color.RGBColorSpace.sRGB, red: 0.88, green: 0.88, blue: 0.88, opacity: 0.5))
        .clipShape(RoundedRectangle(cornerRadius: 5.0))
    }
}

struct SeasonButton_Previews: PreviewProvider {
    static var previews: some View {
        SeasonButton(enabled: .constant(false), text: "Season 1")
    }
}
