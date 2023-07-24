//
//  OnBoardView.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/24/23.
//

import SwiftUI

struct OnBoardView: View {
   
    var body: some View {
        TabView {
            SinglePageView(systemImageName: "figure.walk", title: "Hello title", description: "Hello descritpion")
            SinglePageView(systemImageName: "figure.walk", title: "Hello title", description: "WELCOME descritpion")
            SinglePageView(systemImageName: "figure.walk", title: " title", description: "WELCOME descritpion")
            SinglePageView(systemImageName: "figure.walk", title: "Hello title", description: "Hello descritpion")
            SinglePageView(systemImageName: "figure.walk", title: "Hello title", description: "WELCOME descritpion")
            SinglePageView(systemImageName: "figure.walk", title: " title", description: "WELCOME descritpion")
            SinglePageView(systemImageName: "figure.walk", title: "Hello title", description: "Hello descritpion")
            SinglePageView(systemImageName: "figure.walk", title: "Hello title", description: "WELCOME descritpion")
            SinglePageView(systemImageName: "figure.walk", title: " title", description: "WELCOME descritpion")
            
        }.tabViewStyle(.page(indexDisplayMode: .automatic))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
       OnBoardView()
    }
}

struct SinglePageView: View {
    
    let systemImageName: String
    let title: String
    let description: String
    
    var body: some View {
            VStack {
                Image(systemName: systemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.teal)
                Text(title)
                    .font(.title)
                    .bold()
                Text(description)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
            }.padding(.horizontal, 40)
        }
    }
    
    

