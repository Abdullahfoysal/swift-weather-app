//
//  GameViewModel.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/9/23.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    let columns: [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    @Published  var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published  var isHumanTurn = true
    @Published  var isGameBoardDisabled = false
    @Published  var alertItem: AlertItem?
    
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
    
    func checkWinCondition(for player: Player, in moves: [Move?])-> Bool {
        let winPatterns: Set<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
        let playerMoves = moves.compactMap { $0 }.filter {
            $0.player == player
        }
        
        let playerPositions = Set(playerMoves.map{$0.boardIndex})
        
        for pattern in winPatterns where pattern.isSubset(of: playerPositions){ return true}
        
        
        return false
    }
    
    func checkForDraw(in moves: [Move?])->Bool{
        return moves.compactMap { $0 }.count == 9
        
    }
    func resetGame(){
        moves = Array(repeating: nil,count: 9)
    }
    
    
    
    func processPlayerMove(for position: Int) {
        if isSquareOccupied(in: moves, forIndex: position){return}
        moves[position] = Move(player:  .human , boardIndex: position)
        
        
        //checck for win condition
        if checkWinCondition(for: .human, in: moves){
            print("Human win")
            alertItem = AlertContext.humanWin
            return
        }
        
        if checkForDraw(in: moves){
            print("draw")
            alertItem = AlertContext.draw
            return
        }
        isGameBoardDisabled = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){ [self] in
            let compouterPosition = determineCompouterMovePosition(in: moves)
            moves[compouterPosition] = Move(player:  .computer , boardIndex: compouterPosition)
            isGameBoardDisabled = false
            if checkWinCondition(for: .computer, in: moves){
                print("computer win")
                alertItem = AlertContext.computerWin
                return
            }
            if checkForDraw(in: moves){
                print("draw")
                alertItem = AlertContext.draw
                return
            }
            
        }
        
        
    }
    
}
    


    

enum Player {
    case human, computer
}

struct Move: Hashable {
    let player: Player
    let boardIndex: Int
    var indicator: String {
        return player == .human ? "X" : "O"
    }
}
