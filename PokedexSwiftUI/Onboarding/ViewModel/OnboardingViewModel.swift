//
//  OnboardingViewModel.swift
//  PokedexSwiftUI
//
//  Created by Bruno Marques on 28/01/24.
//

import Foundation
import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentStep: Int = 0
    @Published var onboardingSteps: [OnboardingStep] = []
    @Published var offSet: CGFloat = 0
    @Published var changeToLoginPage: Bool = false
    
    init() {
        setupOnbardingSteps()
    }
    
    private func setupOnbardingSteps() {
        self.onboardingSteps = [
            OnboardingStep(title: "Todos os Pókemons em um só lugar", description: "Acesse uma vasta lista de Pokémons de todas as gerações já feitas pela Nintendo", buttonText: "Continuar"),
            OnboardingStep(title: "Mantenha sua Pokédex atualizada", description: "Cadastre-se e mantenha seu perfil, pokémons favoritos, configurações e muito mais, salvos no aplicativo, mesmo sem conexão com a internet", buttonText: "Vamos começar!")
        ]
    }
}
