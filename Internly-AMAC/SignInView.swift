//
//  Sign-InView.swift
//  Internly-AMAC
//
//  Created by Ari P. Chitulescu on 5/12/26.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInView: View {
    var body: some View {
        SignInWithAppleButton(
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case . success(let authResults):
                    print("Success")
                case . failure(let error):
                    print("Failure: \(error.localizedDescription)")
                }
            }
        )
        .frame(height: 45)
        .padding()
    }
}
