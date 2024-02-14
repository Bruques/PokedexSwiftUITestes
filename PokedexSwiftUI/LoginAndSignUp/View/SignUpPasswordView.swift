//
//  SignUpPasswordView.swift
//  PokedexSwiftUI
//
//  Created by Bruno Marques on 11/02/24.
//

import SwiftUI

struct SignUpPasswordView: View {
    @StateObject var vm: SignUpViewModel
    @FocusState var isFocused: Bool
    var body: some View {
        VStack {
            titleAndDescription
            passwordStack
            Spacer()
            continueButton
        }
        .padding()
        .navigationBarBackButtonHidden()
        .modifier(MyCustomToolbar(title: "Criar conta"))
    }
    
    var titleAndDescription: some View {
        VStack {
            Text("Agora...")
                .font(FontMaker.makeFont(.poppinsRegular, 26))
                .foregroundStyle(PokedexColors.gray700)
            Text("Crie uma senha")
                .font(FontMaker.makeFont(.poppinsSemiBold, 26))
        }
    }
    
    var passwordStack: some View {
        VStack {
            passwordField
                
            Text("Sua senha deve ter pelo menos 8 caracteres.")
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .foregroundStyle(PokedexColors.gray700)
        }
    }
    
    var passwordField: some View {
        Group {
            if vm.isSecureField {
                SecureField("Senha", text: $vm.password)
            } else {
                TextField("Senha", text: $vm.password)
            }
        }
        .focused($isFocused)
        .font(FontMaker.makeFont(.poppinsRegular, 16))
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 2)
                .foregroundStyle(isFocused ? PokedexColors.primary : PokedexColors.lightGray)
                .frame(height: 52)
        }
        .overlay(alignment: .trailing) {
            Image(systemName: vm.isSecureField ? "eye.slash" : "eye")
                .padding()
                .onTapGesture {
                    vm.isSecureField.toggle()
                }
        }
    }
    
    var continueButton: some View {
        NavigationLink {
            SignUpUserNameView(vm: self.vm)
        } label: {
            Capsule()
                .frame(height: 58)
                .foregroundStyle(vm.isPasswordValid ? PokedexColors.blue : PokedexColors.gray100)
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
    SignUpPasswordView(vm: SignUpViewModel())
}
