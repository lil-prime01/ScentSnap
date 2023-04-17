//
//  Contact.swift
//  
//
//  Created by 박리라 on 2023/04/16.
//

import Foundation
import SwiftUI

struct ScentData: Identifiable {
    let red1_0 = 255.0
    let red1_1 = 0.0
    let green1_0 = 0.0
    let green1_1 = 0.0
    let blue1_0 = 0.0
    let blue1_1 = 255.0

    let red2_0 = 255.0
    let red2_1 = 0.0
    let green2_0 = 255.0
    let green2_1 = 255.0
    let blue2_0 = 0.0
    let blue2_1 = 255.0

    let red3_0 = 255.0
    let red3_1 = 0.0
    let green3_0 = 255.0
    let green3_1 = 0.0
    let blue3_0 = 255.0
    let blue3_1 = 0.0
    
    var id = UUID()
    var name: String
    var description:String
    //var date: Date
    var location: String
    var slider1: Double
    var slider2: Double
    var slider3: Double
    var imageData: Data?
    
    var color1: Color {
        Color(
            .sRGB,
            red: (red1_0 * slider1 + red1_1 * (1.0 - slider1)) / 255.0,
            green: (green1_0 * slider1 + green1_1 * (1.0 - slider1)) / 255.0,
            blue: (blue1_0 * slider1 + blue1_1 * (1.0 - slider1)) / 255.0,
            opacity: 1
        )
    }
    var color2: Color {
        Color(
            .sRGB,
            red: (red2_0 * slider2 + red2_1 * (1.0 - slider2)) / 255.0,
            green: (green2_0 * slider2 + green2_1 * (1.0 - slider2)) / 255.0,
            blue: (blue2_0 * slider2 + blue2_1 * (1.0 - slider2)) / 255.0,
            opacity: 1
        )
    }
    var color3: Color {
        Color(
            .sRGB,
            red: (red3_0 * slider3 + red3_1 * (1.0 - slider3)) / 255.0,
            green: (green3_0 * slider3 + green3_1 * (1.0 - slider3)) / 255.0,
            blue: (blue3_0 * slider3 + blue3_1 * (1.0 - slider3)) / 255.0,
            opacity: 1
        )
    }
}
