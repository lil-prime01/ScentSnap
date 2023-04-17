import SwiftUI

struct ContentView: View {
    @State public var scents: [ScentData] = []
    @State private var isScentFormPresented: Bool = false
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 50) {
                    ForEach(scents) { scentdata in
                        PerfumeView(scentdata: scentdata)
                    }
                }
                .padding()
            }
            Button(action: {
                isScentFormPresented.toggle()
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 22, height: 22)
            }
            
            .sheet(isPresented: $isScentFormPresented) {
                ScentForm(scents: $scents)
            }
        }
    }
}

//import SwiftUI
//
//struct ContentView: View {
//    var scentdata: ScentData
//
//    @State public var scents: [ScentData] = []
//    @State private var isScentFormPresented: Bool = false
//
//    var body: some View {
//        VStack {
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 50) {
//                    NavigationLink(destination: ImageView(scentdata: scentdata)) {
//                        ForEach(scents) { scentdata in
//                            PerfumeView(scentdata: scentdata)
//                        }
//                    }
//                }
//                .padding()
//            }
//
//            Button(action: {
//                isScentFormPresented.toggle()
//            }) {
//                Image(systemName: "plus")
//                    .resizable()
//                    .frame(width: 22, height: 22)
//            }
//            .sheet(isPresented: $isScentFormPresented) {
//                ScentForm(scents: $scents)
//            }
//        }
//    }
//}
