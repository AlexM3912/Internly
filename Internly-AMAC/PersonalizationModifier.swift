//
//  PersonalizationModifier.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/12/26.
//

import SwiftUI

struct frameForCategories: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .frame(width: 200, height: 100, alignment: .center)
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
            .border(Color.green, width: 2)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
