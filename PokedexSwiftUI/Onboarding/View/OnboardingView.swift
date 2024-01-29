//
//  FirstOnboardingView.swift
//  PokedexSwiftUI
//
//  Created by Bruno Marques on 27/01/24.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    var body: some View {
        TabView(selection: $viewModel.currentStep) {
            ForEach(0..<viewModel.onboardingSteps.count, id: \.self) { index in
                VStack {
                    trainersImages()
                    Spacer().frame(height: 45)
                    titleAndDescription(title: viewModel.onboardingSteps[index].title,
                                        description: viewModel.onboardingSteps[index].description)
                    Spacer().frame(height: 50)
                    continueButton(buttonText: viewModel.onboardingSteps[index].buttonText)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding()
                .overlay {
                    if index == 0 {
                        GeometryReader { proxy -> Color in
                            let minX = proxy.frame(in: .global).minX
                            print(-minX)
                            DispatchQueue.main.async {
                                withAnimation(.default) {
                                    self.viewModel.offSet = -minX
                                }
                            }
                            return Color.clear
                        }
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .overlay {
            HStack(spacing: 8) {
                ForEach(viewModel.onboardingSteps.indices, id: \.self) { index in
                    Capsule()
                        .foregroundStyle(index == viewModel.currentStep ? Color("Blue") : Color("Secondary"))
                        .frame(width: getIndex() == index ? 28 : 9, height: 9)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 95)
        }
    }
    
    @ViewBuilder
    func trainersImages() -> some View {
        if viewModel.currentStep == 0 {
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
        } else {
            HStack {
                Image("trainer3")
            }
        }
    }
    
    func titleAndDescription(title: String, description: String) -> some View {
        VStack(spacing: 16) {
            Text(title)
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
            Text(description)
                .font(Font.custom("Poppins", size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Secondary"))
        }
    }
    
    func continueButton(buttonText: String) -> some View {
        Button {
            if viewModel.currentStep < viewModel.onboardingSteps.count - 1 {
                self.viewModel.currentStep += 1
            }
        } label: {
            Rectangle()
                .clipShape(.capsule)
                .frame(height: 58)
                .foregroundStyle(Color("Blue"))
                .overlay {
                    Text(buttonText)
                        .font(Font.custom("Poppins-SemiBold", size: 18))
                        .foregroundStyle(.white)
                }
        }
    }
    
    func getIndex() -> Int {
        let index = Int(round(Double(viewModel.offSet / getWitdh())))
        return index
    }
}

extension View {
    func getWitdh() -> CGFloat {
        return UIScreen.main.bounds.width
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
