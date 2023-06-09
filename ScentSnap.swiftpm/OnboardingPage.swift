//
//  OnboardingPage.swift
//  ScentSnap
//
//  Created by 박리라 on 2023/04/19.
//

import SwiftUI

struct OnboardingPage: View {
    var title: String
    var action: () -> Void
    @State private var showText = true
    @State private var isTextFullyDisplayed = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                if showText {
                    TypingText(text: title, onDisappear: { showText = false }, isTextFullyDisplayed: $isTextFullyDisplayed)
                }
                
                Spacer()
                
                if isTextFullyDisplayed {
                    Button(action: {
                        withAnimation {
                            showText = false
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            action()
                        }
                    }, label: {
                        Text("Next")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                    })
                }
            }
            .onAppear {
                showText = true
            }
        }
    }
}
