//
//  TypingText.swift
//  ScentSnap
//
//  Created by 박리라 on 2023/04/19.
//

import SwiftUI

struct TypingText: View {
    @State private var displayText = ""
    let text: String
    let onDisappear: () -> Void
    @State private var opacity: Double = 1
    @Binding var isTextFullyDisplayed: Bool

    var body: some View {
        Text(displayText)
            .font(.largeTitle)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .opacity(opacity)
            .animation(.easeInOut(duration: 1), value: opacity)
            .transition(.opacity)
            .onAppear {
                var tempText = ""
                for (index, character) in text.enumerated() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) { // Change the duration to 0.05 for faster typing
                        tempText.append(character)
                        displayText = tempText
                    }
                }
            }
            .onChange(of: opacity) { _ in
                if opacity == 0 {
                    onDisappear()
                }
            }
            .onAppear {
                var tempText = ""
                for (index, character) in text.enumerated() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                        tempText.append(character)
                        displayText = tempText
                        if index == text.count - 1 {
                            isTextFullyDisplayed = true
                        }
                    }
                }
            }
    }
}
