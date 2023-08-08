//
//  DiceAppUIView.swift
//  swiftUI-weather
//
//  Created by Foysal on 8/4/23.
//

import SwiftUI

struct DiceAppUIView: View {
   @State var letfDiceNumber: Int = 1
    @State var rightDiceNumber: Int = 3
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(diceImage: letfDiceNumber)
                    DiceView(diceImage: rightDiceNumber)
                   
                   
                }.padding()
                Spacer()
                Button {
                    letfDiceNumber = Int.random(in: 1...6)
                    rightDiceNumber = Int.random(in: 1...6)
                    
                }label: {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                       
                }.background(.red)
                Spacer()
            }
           
        }
    }
}
struct DiceView: View {
    let diceImage: Int
    var body: some View {
        Image("dice\(diceImage)")
            .resizable()
            .aspectRatio(1,contentMode: .fit)
            .padding()
    }
}

struct DiceAppUIView_Previews: PreviewProvider {
    static var previews: some View {
        DiceAppUIView()
    }
}


