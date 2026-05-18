//
//  frameForCategories.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/14/26.
//


//
//  PersonalizationModifier.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/12/26.
//

import SwiftUI
//modifier for the categories and moods
struct frameForTopics: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
//            .buttonStyle(.glassProminent)
            .frame(width: 100, height: 50, alignment: .center)
            .background(
                RadialGradient(colors: [.white, .green], center: .top, startRadius: 5, endRadius: 150)
            )
            .foregroundStyle(
                LinearGradient(
                    colors: [.yellow, .green, .yellow],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
