//
//  AngelaPracticeUI.swift
//  swiftUI-weather
//
//  Created by Foysal on 8/4/23.
//

import SwiftUI



struct AngelaPracticeUI: View {
    var lelinInt = 10
  
    var body: some View {
        ZStack {
            Color(hex: "#1abc9c").ignoresSafeArea()
            VStack {
               
                Image("image1").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle()
                        .stroke(Color.white,lineWidth: 5))
                Text("Angela Yu")
                    .font(.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
    
                InfoView(text: "+23456789876", imageName: "phone.fill")
                InfoView(text: "angela@gmail.com", imageName: "envelope.fill")
                    
            }.onAppear {
                print(lelinInt.toFoysal(n: 100))
            }
           
            
           
        }
       
            
            
        
    }
}

struct AngelaPracticeUI_Previews: PreviewProvider {
    static var previews: some View {
        AngelaPracticeUI()
    }
}

extension Color {
    init(hex: String) {
        // Remove any prefix like "#" from the hex string
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanedHex = cleanedHex.replacingOccurrences(of: "#", with: "")

        // Convert the cleaned hex string to an integer value
        var rgbValue: UInt64 = 0
        Scanner(string: cleanedHex).scanHexInt64(&rgbValue)

        // Extract the red, green, and blue components from the integer value
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        // Initialize the Color with the extracted components
        self.init(red: red, green: green, blue: blue)
    }
}

extension Int {
    func toFoysal(n: Int)-> String {
        return "Foysal"
    }
}

struct InfoView: View {
    let text: String
    let imageName: String
    var body: some View {
        Rectangle()
            .fill(.white)
            .cornerRadius(25)
        
            .padding(.horizontal, 10 )
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(.green)
                    .frame(height: 50)
                
                Text(text)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            })
    }
}
