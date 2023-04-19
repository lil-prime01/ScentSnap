import SwiftUI


struct ContentView: View {
    @State public var scents: [ScentData] = []
    @State private var isScentFormPresented: Bool = false
    @State private var isOnboardingCompleted: Bool = false
    @State public var currentIndex = 0
    
    var body: some View {
                    Group {
                        if !isOnboardingCompleted {
                            OnboardingView {
                                withAnimation(.easeInOut(duration: 2)) {
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
        
        
        ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing:0) {
                        ForEach(scents) { scentdata in
                            PerfumeView(scentdata: scentdata)
                        }
                    }
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewOffsetKey.self,
                            value: -$0.frame(in: .named("scroll")).origin.x)
                    })
                    .onPreferenceChange(ViewOffsetKey.self) {
                        currentIndex = Int(($0 + 512 ) / 1024)
                        print("offset >> \($0)") }
                }
                .overlay(alignment: .bottom, content: {
                      HStack(spacing: 8){
                        ForEach(scents.indices,id: \.self){index in
                          Circle()
                                .fill(index==currentIndex ? Color.gray : Color.black)
                                .frame(width: index==currentIndex ? 16 : 8, height: index==currentIndex ? 16 : 8)
                        }
                      }
                      .offset(y: -180)
                      .animation(.easeInOut(duration: 0.2))
                      })
                .onAppear {
                    UIScrollView.appearance().isPagingEnabled = true
                    AudioManager.shared.startBackgroundMusic(filename: "BackgroundMusic", fileExtension: "mp3")
                }
            .offset(y:-50)
            .coordinateSpace(name: "scroll")
            
            
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
            .offset(y:553)
            .sheet(isPresented: $isScentFormPresented) {
                ScentForm(scents: $scents)
            }
        }
    }
}


struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
