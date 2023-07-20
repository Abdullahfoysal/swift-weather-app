//
//  SegmentView.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/20/23.
//

import SwiftUI

struct SegmentView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .yellow
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
    }
    
    @State private var selectedSide: SideOfTheForce = .dark
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Choose a Side", selection: $selectedSide){
                    ForEach(SideOfTheForce.allCases, id: \.self){
                        Text($0.rawValue)
                        
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                Spacer()
                ChosenHeroView(selectedSide: selectedSide)
                Spacer()
            }.navigationTitle("Choose a Slide")
        }
    }

}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView()
    }
}

enum SideOfTheForce: String, CaseIterable {
    case light = "Light"
    case grey = "Grey"
    case dark = "Dark"
    
}


struct ChosenHeroView: View {
    var selectedSide: SideOfTheForce
    
    var body: some View {
        switch selectedSide {
        case .light:
            HeroImageView(heroName: "image2")
        case .grey:
            HeroImageView(heroName: "image1")
        case .dark:
            HeroImageView(heroName: "image2")
        }
    }
}

struct HeroImageView: View {
    var heroName: String
    
    var body: some View {
        Image(heroName)
            .resizable()
            .frame(width: 250,height: 300)
            .shadow(color: .white, radius: 100)
    }
}
