//
//  FirstOnboardingView.swift
//  PokedexSwiftUI
//
//  Created by Bruno Marques on 27/01/24.
//

import SwiftUI

struct FirstOnboardingView: View {
    var body: some View {
        VStack {
            trainersImages
            Spacer().frame(height: 45)
            titleAndDescription
            Spacer().frame(height: 24)
            onboardingProgressView
            Spacer().frame(height: 24)
            continueButton
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding(.horizontal, 16)
        .padding(.bottom, 40)
    }
    
    var trainersImages: some View {
        HStack(spacing: -150) {
            Image("trainer1")
                .background {
                    Image("shadowTrainer1")
                        .offset(x: -15, y: 110)
                }
            Image("trainer2")
                .background {
                    Image("shadowTrainer2")
                        .offset(y: 120)
                }
        }
    }
    
    var titleAndDescription: some View {
        VStack(spacing: 16) {
            Text("Todos os Pokemóns em um só lugar")
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
            Text("Acesse uma vasta lista de Pokémon de todas as gerações já feitas pela Nintendo")
                .font(Font.custom("Poppins", size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Secondary"))
        }
    }
    
    var onboardingProgressView: some View {
        HStack {
            Rectangle()
                .clipShape(.capsule)
                .frame(width: 28, height: 9)
                .foregroundStyle(Color("Blue"))
            Circle()
                .frame(width: 9, height: 9)
                .foregroundStyle(Color(.lightGray))
        }
    }
    
    var continueButton: some View {
        Button {
            // Action
        } label: {
            Rectangle()
                .clipShape(.capsule)
                .frame(height: 58)
                .foregroundStyle(Color("Blue"))
                .overlay {
                    Text("Continuar")
                        .font(Font.custom("Poppins-SemiBold", size: 18))
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    FirstOnboardingView()
}
