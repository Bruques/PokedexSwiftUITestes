//
//  SignUpEmailView.swift
//  PokedexSwiftUI
//
//  Created by Bruno Marques on 06/02/24.
//

import SwiftUI

struct SignUpEmailView: View {
    @StateObject var vm: SignUpViewModel
    var body: some View {
        VStack {
            titleAndDescription
            emailField
            Spacer()
            continueButton
        }
        .padding()
        .navigationBarBackButtonHidden()
        .modifier(MyCustomToolbar(title: "Criar conta"))
    }
    
    var titleAndDescription: some View {
        VStack {
            Text("Vamos começar!")
                .font(FontMaker.makeFont(.poppinsRegular, 26))
                .foregroundStyle(PokedexColors.gray700)
            Text("Qual é o seu e-mail?")
                .font(FontMaker.makeFont(.poppinsSemiBold, 26))
        }
    }
    
    var emailField: some View {
        VStack {
            TextField("E-mail", text: $vm.email, onEditingChanged: { editingChanged in
                self.vm.emailFocused = editingChanged
            })
            .keyboardType(.emailAddress)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .textContentType(.emailAddress)
            .font(FontMaker.makeFont(.poppinsRegular, 16))
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(vm.emailFocused ? PokedexColors.primary : PokedexColors.lightGray)
                    .frame(height: 52)
            }
            
            Text("Use um endeço de e-mail válido.")
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .foregroundStyle(PokedexColors.gray700)
        }
    }
    
    var continueButton: some View {
        NavigationLink {
            SignUpPasswordView(vm: self.vm)
        } label: {
            Capsule()
                .frame(height: 58)
                .foregroundStyle(vm.isEmailValid ? PokedexColors.blue : PokedexColors.gray100)
                .overlay {
                    Text("Continuar")
                        .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                        .foregroundStyle(.white)
                }
        }
        .disabled(vm.email.isEmpty ? true : false)
    }
}

#Preview {
    SignUpEmailView(vm: SignUpViewModel())
}
