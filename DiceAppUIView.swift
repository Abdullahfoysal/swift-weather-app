//
//  DiceAppUIView.swift
//  swiftUI-weather
//
//  Created by Foysal on 8/4/23.
//

import SwiftUI

struct DiceAppUIView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
    }
}

struct DiceAppUIView_Previews: PreviewProvider {
    static var previews: some View {
        DiceAppUIView()
    }
}
