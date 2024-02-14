//
//  FirstOnboardingView.swift
//  PokedexSwiftUI
//
//  Created by Bruno Marques on 27/01/24.
//

import SwiftUI

enum OnboardingSteps: Int {
    case onboardingFirstStep
    case onboardingLastStep
}

struct OnboardingView: View {
    enum Constants {
        static let trainer1 = "trainer1"
        static let trainer2 = "trainer2"
        static let trainer3 = "trainer3"
        static let shadowTrainer = "shadowTrainer"
    }
    
    @StateObject var viewModel: OnboardingViewModel = OnboardingViewModel()
    
    var body: some View {
        NavigationView {
            TabView(selection: $viewModel.currentStep) {
                ForEach(Array(viewModel.onboardingSteps.enumerated()), 
                        id: \.offset) { index, step  in
                    VStack {
                        trainersImages(stepIndex: index)
                        Spacer().frame(height: 45)
                        titleAndDescription(title: step.title,
                                            description: step.description)
                        Spacer().frame(height: 50)
                        continueButton(buttonText: step.buttonText)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding()
            .overlay {
                onboardingIndicator
            }
        }
    }
    
    @ViewBuilder
    func trainersImages(stepIndex: Int) -> some View {
        if stepIndex == OnboardingSteps.onboardingFirstStep.rawValue {
            HStack(spacing: -150) {
                Image(Constants.trainer1)
                    .background {
                        Image(Constants.shadowTrainer)
                            .offset(x: -15, y: 110)
                    }
                Image(Constants.trainer2)
                    .background {
                        Image(Constants.shadowTrainer)
                            .offset(y: 120)
                    }
            }
        } else {
            HStack {
                Image(Constants.trainer3)
                    .background {
                        Image(Constants.shadowTrainer)
                            .offset(x: -10, y: 120)
                    }
            }
        }
    }
    
    func titleAndDescription(title: String, description: String) -> some View {
        VStack(spacing: 16) {
            Text(title)
                .font(FontMaker.makeFont(.poppinsMedium, 26))
                .multilineTextAlignment(.center)
            Text(description)
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(PokedexColors.secondary)
        }
    }
    
    var onboardingIndicator: some View {
        HStack(spacing: 8) {
            ForEach(viewModel.onboardingSteps.indices, id: \.self) { index in
                Capsule()
                    .foregroundStyle(index == viewModel.currentStep ? PokedexColors.blue : PokedexColors.secondary)
                    .frame(width: viewModel.currentStep == index ? 28 : 9, height: 9)
                    .animation(.bouncy, value: viewModel.currentStep)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom, 110)
    }
    
    @ViewBuilder
    func continueButton(buttonText: String) -> some View {
        if viewModel.currentStep == OnboardingSteps.onboardingFirstStep.rawValue {
            Button {
                withAnimation {
                    viewModel.currentStep += 1
                }
            } label: {
                Rectangle()
                    .clipShape(.capsule)
                    .frame(height: 58)
                    .foregroundStyle(PokedexColors.blue)
                    .overlay {
                        Text(buttonText)
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                            .foregroundStyle(.white)
                    }
            }
        } else {
            NavigationLink {
                LoginOrSignUpView()
                    .navigationBarBackButtonHidden()
            } label: {
                Rectangle()
                    .clipShape(.capsule)
                    .frame(height: 58)
                    .foregroundStyle(PokedexColors.blue)
                    .overlay {
                        Text(buttonText)
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                            .foregroundStyle(.white)
                    }
            }
        }
    }
}

#Preview {
    OnboardingView()
}

