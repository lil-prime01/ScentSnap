//
//  SwiftUIView.swift
//  
//
//  Created by 박리라 on 2023/04/19.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    
    let onCompleted: () -> Void
    
    func playBackgroundMusic() {
        AudioManager.shared.playBackgroundMusic(filename: "Memories", fileExtension: "mp3")
    }
    
    var body: some View {
        Group {
            if currentPage == 0 {
                OnboardingPage(title: "Welcome to the Running App") {
                    currentPage += 1
                }
                .onAppear(perform: playBackgroundMusic)
            } else if currentPage == 1 {
                OnboardingPage(title: "Track your runs") {
                    currentPage += 1
                }
            } else {
                OnboardingPage(title: "Let's get started!") {
                    onCompleted()
                }
            }
        }
    }
}
