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

    var body: some View {
        Text(displayText)
            .font(.largeTitle)
            .foregroundColor(.white)
            .opacity(opacity)
            .animation(.easeInOut(duration: 1), value: opacity)
            .onAppear {
                var tempText = ""
                for (index, character) in text.enumerated() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
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
    }
}
