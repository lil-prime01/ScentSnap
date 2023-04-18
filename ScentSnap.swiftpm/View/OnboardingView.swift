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
                OnboardingPage(title: "The sense of smell is invisible to our eyes,\nbut it has the power to control people's living space unconsciously.") {
                    currentPage += 1
                }
                .onAppear(perform: playBackgroundMusic)
            } else if currentPage == 1 {
                OnboardingPage(title: "Unlike vision and hearing, olfactory sense does not have terms or codes that can be expressed or described.\nHowever, smell adds emotion to memory.") {
                    currentPage += 1
                }
            } else {
                OnboardingPage(title: "So I came up with a <ScentSnap> application that reads the person's emotions, brings back memories, and records the scent with images.") {
                    onCompleted()
                }
            }
        }
    }
}
