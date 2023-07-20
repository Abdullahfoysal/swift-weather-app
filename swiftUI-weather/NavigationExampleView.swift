//
//  NavigationExampleView.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/20/23.
//

import SwiftUI

struct NavigationExampleView: View {
    var body: some View {
        RedView()
    }
}



struct NavigationExampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationExampleView()
    }
}


struct RedView: View {
    var body: some View {
        NavigationView {
            VStack {
                CircleNumberView(color: .red, number: 1)
                    .navigationTitle("Red One")
                    .offset(y: -60)
                NavigationLink(destination: BlueView(), label:  {
                    Text("Next Screen")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
        }.accentColor(Color(.label))
       
    }
}

struct BlueView: View {
    var body: some View {
 
            VStack {
                CircleNumberView(color: .blue, number: 2)
                    .navigationTitle("Blue One")
                    .offset(y: -60)
                NavigationLink(destination: GreenView(), label:  {
                    Text("Next Screen").bold()
                        .frame(width: 280, height: 50)
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
        
       
    }
}

struct GreenView: View {
    var body: some View {
       
        VStack {
            CircleNumberView(color: .green, number: 3)
                .navigationTitle("Green One")
                .offset(y: -60)
            
        }
            
        
       
    }
}
struct CircleNumberView: View {
    var color: Color
    var number: Int
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200,height: 200)
                .foregroundColor(color)
            Text("\(number)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold))
        }
    }
}
