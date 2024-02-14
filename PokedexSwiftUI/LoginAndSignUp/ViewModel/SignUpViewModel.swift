//
//  SignUpViewModel.swift
//  PokedexSwiftUI
//
//  Created by Bruno Marques on 06/02/24.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var isEmailValid: Bool = false
    @Published var emailFocused: Bool = false
    @Published var password: String = ""
    @Published var isPasswordValid: Bool = false
    @Published var isSecureField: Bool = true
    @Published var username: String = ""
    @Published var isUsername: Bool = false
    @Published var isUsernameValid: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    init() {
        setupBindings()
    }
    
    private func setupBindings() {
        $email
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { email in
            self.isEmailValid = self.validateEmail(enteredEmail: email)
        }.store(in: &cancellables)
        
        $password.sink { password in
            if !password.isEmpty {
                self.isPasswordValid = true
            } else {
                self.isPasswordValid = false
            }
        }.store(in: &cancellables)
        
        $username.sink { username in
            if !username.isEmpty {
                self.isUsernameValid = true
            } else {
                self.isUsername = false
            }
        }.store(in: &cancellables)
    }
    
    private func validateEmail(enteredEmail:String) -> Bool {

        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)

    }
}
