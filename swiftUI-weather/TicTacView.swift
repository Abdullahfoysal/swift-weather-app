//
//  TicTacView.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/6/23.
//

import SwiftUI


struct TicTacView: View {
    let columns: [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]

    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isHumanTurn = true
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: columns,spacing: 5){
                    ForEach(0..<9){ i in
                        ZStack {
                            Circle()
                                .foregroundColor(.red)
                                .opacity(0.5)
                                .frame(width: geometry.size.width/3 - 15 ,height: geometry.size.width/3 - 15 )
                            
                            Text(moves[i]?.indicator ?? "")
                                .fontWeight(.heavy)
                                .bold()
                          
                        }.onTapGesture {
                            if isSquareOccupied(in: moves, forIndex:i){return}
                            moves[i] = Move(player:  .human , boardIndex: i)
                            
                            //checck for win condition
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                let compouterPosition = determineCompouterMovePosition(in: moves)
                                moves[compouterPosition] = Move(player:  .computer , boardIndex: compouterPosition)
                                
                            }
                          
                        }
                    }
                    
                }
                Spacer()
            }.padding()
        }
    }
    
    func isSquareOccupied(in moves: [Move?],forIndex index: Int )->Bool {
        return moves.contains(where:{$0?.boardIndex == index})
    }
    func determineCompouterMovePosition(in moves: [Move?])-> Int {
        var movePosition = Int.random(in: 0..<9)
        while isSquareOccupied(in: moves, forIndex: movePosition){
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
}
enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    var indicator: String {
        return player == .human ? "X" : "O"
    }
}

struct TicTacView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacView()
    }
}
