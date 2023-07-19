//
//  Alerts.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/9/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
    
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win!"), message: Text("YOu are so smart. YOu beat your own AI"), buttonTitle: Text("Hell yeah"))
    
  static  let computerWin = AlertItem(title: Text("You Lost"), message: Text("You prgrammed a super AI"), buttonTitle: Text("Rematch"))
    
    static let draw = AlertItem(title: Text("Draw"), message: Text("What a battle of wits we have here.."), buttonTitle: Text("Try Again"))
}


