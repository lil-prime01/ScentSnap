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
            .onAppear {
                        sampleAdd()
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
            .offset(y:533)
            .sheet(isPresented: $isScentFormPresented) {
                ScentForm(scents: $scents)
            }
        }
    }
    public func sampleAdd(){
        let sampleImage1 = UIImage(named: "My Mom")
        let imageData1 = sampleImage1?.jpegData(compressionQuality: 1.0)
        
        let sampleImage2 = UIImage(named: "The Barber Shop")
        let imageData2 = sampleImage2?.jpegData(compressionQuality: 1.0)
        
        let sampleImage3 = UIImage(named: "Moist Garden")
        let imageData3 = sampleImage3?.jpegData(compressionQuality: 1.0)

        let scent1 = ScentData(
            name: "My Mom",
            description: "The scent of being with my mom when I was young",
            date: Date(),
            location: "Los Angeles, California",
            slider1: 1.0,
            slider2: 1.0,
            slider3: 1.0,
            imageData: imageData1
        )
        
        let scent2 = ScentData(
            name: "The Barber Shop",
            description: "The barber shop I went with my dad",
            date: Date(),
            location: "San Francisco, California",
            slider1: 0.0,
            slider2: 0.0,
            slider3: 0.0,
            imageData: imageData2
        )
        
        let scent3 = ScentData(
            name: "Moist Garden",
            description: "A refreshing scent from the lawn",
            date: Date(),
            location: "UCLA, California",
            slider1: 0.1,
            slider2: 0.9,
            slider3: 0.3,
            imageData: imageData3
        )

        scents.append(scent1)
        scents.append(scent2)
        scents.append(scent3)
    }

}


struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

