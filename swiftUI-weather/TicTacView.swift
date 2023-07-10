//
//  TicTacView.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/6/23.
//

import SwiftUI


struct TicTacView: View {
    @StateObject private var viewModel = GameViewModel()
    
    
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: viewModel.columns,spacing: 5){
                    ForEach(0..<9){ i in
                        ZStack {
                            Circle()
                                .foregroundColor(.red)
                                .opacity(0.5)
                                .frame(width: geometry.size.width/3 - 15 ,height: geometry.size.width/3 - 15 )
                            
                            Text(viewModel.moves[i]?.indicator ?? "")
                                .fontWeight(.heavy)
                                .bold()
                            
                        }.onTapGesture {
                            viewModel.processPlayerMove(for: i)
                            
                        }
                        
                    }
                  
                }
                .disabled(viewModel.isGameBoardDisabled)
                .padding()
                .alert(item: $viewModel.alertItem, content: {alertItem in
                    Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: .default(alertItem.buttonTitle,action: {viewModel.resetGame()}))
                    
                })
                Spacer()
            }
        }
        
        
    }
}



struct TicTacView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacView()
    }
}
