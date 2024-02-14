//
//  LoginOrSignUpViewModel.swift
//  PokedexSwiftUI
//
//  Created by Bruno Marques on 06/02/24.
//

import Foundation

class LoginOrSignUpViewModel: ObservableObject {
    init() {}
    
    public func makeSignUpViewModel() -> SignUpViewModel {
        return SignUpViewModel()
    }
}
