//
//  LabelView.swift
//
//
//  Created by 박리라 on 2023/04/15.
//

import SwiftUI

var titleSize = labelHeight*0.15
var bord = labelHeight*0.037
let date = Date()




struct LabelView: View {
    var scentdata: ScentData
    func formatDate(_ date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: date)
        }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .frame(width: labelWidth, height:labelHeight*1.5)
            .overlay(
                    RoundedRectangle(cornerRadius: 15) // Apply the corner radius to the border
                        .stroke(Color.black, lineWidth: bord) // Set border color and width
                )
            .overlay(
                VStack{
                    Text(scentdata.name)
                        .font(.system(size:titleSize ).bold())
                        .padding()
                    Text(scentdata.description)
                        .padding()
                        .font(.system(size:titleSize*0.5).bold())
                        .padding()
                    Text("\(formatDate(scentdata.date))")
                        .padding()
                        .font(.system(size:titleSize*0.5).bold())
                        .padding()
                    HStack{
                        Image("mapicon")
                            .resizable()
                            .frame(width: titleSize*0.4, height: titleSize*0.4)
                            .colorInvert()
                            .colorMultiply(.black)
                        Text(scentdata.location)
                            .font(.system(size:titleSize*0.35).bold())
                    }
                    
                }
            )
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        let scentdata = ScentData(name: "John", description: "hello", date: date, location: "dd", slider1: 1.0, slider2: 1.0, slider3: 1.0)
        return LabelView(scentdata: scentdata)
    }
}
