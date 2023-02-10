//
//  InputFieldView.swift
//  DogEncyclopedia
//
//  Created by Jacob on 2/10/23.
//

import SwiftUI

struct InputFieldView: View {
    @Binding var textValue: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .shadow(color: .gray.opacity(0.5),
                        radius: 15,
                        x: 2,
                        y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.5), lineWidth: 0.25)
                )

            TextField("🔍 German Shepherd", text: $textValue)
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.horizontal, 15)
        }
    }
}

struct InputFieldView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        InputFieldView(textValue: .constant(""))
    }
}
