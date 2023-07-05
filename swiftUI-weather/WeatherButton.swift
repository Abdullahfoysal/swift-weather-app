//
//  weatherButton.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/5/23.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280,height: 50)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .font(.system(size: 20,weight: .bold,design: .default))
            .cornerRadius(10.0)
    }
}
