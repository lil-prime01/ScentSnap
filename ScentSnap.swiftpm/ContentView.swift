import SwiftUI

struct ContentView: View {
    @State public var scents: [ScentData] = []
    @State private var isScentFormPresented: Bool = false
    @State private var isOnboardingCompleted: Bool = false
    
    var body: some View {
            Group {
                if !isOnboardingCompleted {
                    OnboardingView {
                        withAnimation(.easeInOut(duration: 2)) { // Increase the duration to 2 for a slower transition
                            isOnboardingCompleted = true
                        }
                    }
                } else {
                    mainAppView
                }
            }
            .accentColor(.black)
        }
    var mainAppView: some View {
        VStack {
            Spacer(minLength: screenHeight*0.1)
            GeometryReader { proxi in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(scents) { scentdata in
                            PerfumeView(scentdata: scentdata)
                        }
                            .padding(.leading, space) // Add leading padding to the first PerfumeView
                            .padding(.trailing, space) // Add trailing padding to the last PerfumeView
                    }
                }
                .onAppear {
                    UIScrollView.appearance().isPagingEnabled = true
                    AudioManager.shared.startBackgroundMusic(filename: "BackgroundMusic", fileExtension: "mp3") // Call the startBackgroundMusic function
                }
            }
        
            Button(action: {
                isScentFormPresented.toggle()
            }) {
                Circle()
                    .fill(Color.black)
                    .frame(width: screenHeight*0.06, height: screenHeight*0.06)
                    .overlay(
                        Image("pencil")
                            .resizable()
                            .frame(width: screenHeight*0.025, height: screenHeight*0.025)
                            .colorInvert()
                            .colorMultiply(.white)
                    )
                
                    
            }
            
            .sheet(isPresented: $isScentFormPresented) {
                ScentForm(scents: $scents)
            }
        }
    }
}
