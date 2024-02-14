//
//  SignUpView.swift
//  PokedexSwiftUI
//
//  Created by Bruno Marques on 05/02/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var vm = SignUpViewModel()
    var body: some View {
            VStack {
                trainerImage
                titleAndDescription
                Spacer().frame(height: 32)
                signUpButtons
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 40)
            .modifier(MyCustomToolbar(title: "Criar conta"))
            .navigationBarBackButtonHidden()
    }
    
    var trainerImage: some View {
        Image("trainer6")
    }
    
    var titleAndDescription: some View {
        VStack(spacing: 16) {
            Text("Falta pouco para explorar esse mundo!")
                .font(FontMaker.makeFont(.poppinsMedium, 26))
                .multilineTextAlignment(.center)
            Text("Como deseja se conectar?")
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .foregroundStyle(PokedexColors.secondary)
        }
    }
    
    var signUpButtons: some View {
        VStack(spacing: 12) {
            //apple button
            signUpAppleButton

            //google button
            signUpGoogleButton
            
            //firebase button
            signUpFirebaseButton
        }
        .padding(.horizontal)
    }
    
    var signUpAppleButton: some View {
        NavigationLink {
            //LoginApple
        } label: {
            Capsule()
                .stroke(PokedexColors.lightGray, lineWidth: 2)
                .frame(height: 58)
                .overlay {
                    HStack(spacing: 16) {
                        Image("appleVector")
                        Text("Continuar com a Apple")
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                            .foregroundStyle(PokedexColors.gray700)
                    }
                }
        }
    }
    
    var signUpGoogleButton: some View {
        NavigationLink {
            //Login google
        } label: {
            Capsule()
                .stroke(PokedexColors.lightGray, lineWidth: 2)
                .frame(height: 58)
                .overlay {
                    HStack(spacing: 16) {
                        Image("googleVector")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Continuar com o Google")
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                            .foregroundStyle(PokedexColors.gray700)
                    }
                }
        }
    }
    
    var signUpFirebaseButton: some View {
        NavigationLink {
            // Login firebase
            SignUpEmailView(vm: self.vm)
            
        } label: {
            Capsule()
                .frame(height: 58)
                .foregroundStyle(PokedexColors.blue)
                .overlay {
                    Text("Continuar com um e-mail")
                        .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    SignUpView()
}
