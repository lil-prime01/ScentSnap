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
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                if showText {
                    TypingText(text: title, onDisappear: { showText = false })
                }
                
                Spacer()
                
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
                        .background(Color.blue)
                        .cornerRadius(10)
                })
            }
            .onAppear {
                showText = true
            }
        }
    }
}
