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
        AudioManager.shared.startBackgroundMusic(filename: "Memories", fileExtension: "mp3")
    }
    
    var body: some View {
        Group {
            if currentPage == 0 {
                OnboardingPage(title: "The sense of scent has the power to control our emotion.") {
                    currentPage += 1
                }
                .onAppear(perform: playBackgroundMusic)
            } else if currentPage == 1 {
                OnboardingPage(title: "Scent adds emotion to your memory.") {
                    currentPage += 1
                }
            } else {
                OnboardingPage(title: "Snap your scent with your memory.") {
                    onCompleted()
                }
            }
        }
    }
}
