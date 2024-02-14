//
//  SignUpUserNameView.swift
//  PokedexSwiftUI
//
//  Created by Bruno Marques on 11/02/24.
//

import SwiftUI

struct SignUpUserNameView: View {
    @StateObject var vm: SignUpViewModel
    @FocusState var isFocused: Bool
    var body: some View {
        VStack {
            titleAndDescription
            userNameField
            Spacer()
            continueButton
        }
        .padding()
        .navigationBarBackButtonHidden()
        .modifier(MyCustomToolbar(title: "Criar conta"))
    }
    
    var titleAndDescription: some View {
        VStack {
            Text("Para finalizar")
                .font(FontMaker.makeFont(.poppinsRegular, 26))
                .foregroundStyle(PokedexColors.gray700)
            Text("Qual é o seu nome?")
                .font(FontMaker.makeFont(.poppinsSemiBold, 26))
        }
    }
    
    var userNameField: some View {
        VStack {
            TextField("Nome", text: $vm.username)
                .focused($isFocused)
                .font(FontMaker.makeFont(.poppinsRegular, 16))
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(isFocused ? PokedexColors.primary : PokedexColors.lightGray)
                        .frame(height: 52)
                }
            
            Text("Esse será seu nome de usuário no app.")
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .foregroundStyle(PokedexColors.gray700)
        }
    }
    
    var continueButton: some View {
        NavigationLink {
            
        } label: {
            Capsule()
                .frame(height: 58)
                .foregroundStyle(vm.isUsernameValid ? PokedexColors.blue : PokedexColors.gray100)
                .overlay {
                    Text("Criar conta")
                        .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                        .foregroundStyle(.white)
                }
        }
        .disabled(vm.email.isEmpty ? true : false)
    }
}

#Preview {
    SignUpUserNameView(vm: SignUpViewModel())
}
