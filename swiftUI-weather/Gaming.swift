//
//  Gaming.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/6/23.
//

import SwiftUI

struct Gaming: View {
    
    var platforms: [Platform] = [
        .init(name: "Xbox-Platform", imageName: "xbox.logo", color: .green),
        .init(name: "PlatStation", imageName: "xbox.logo", color: .indigo),
        .init(name: "Mobile", imageName: "xbox.logo", color: .red)]
    
    var games: [Game] = [
        .init(name: "Xbox-Game", imageName: "xbox.logo", color: .green),
        .init(name: "PlatStation", imageName: "xbox.logo", color: .indigo),
        .init(name: "Mobile", imageName: "xbox.logo", color: .red)]
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path)  {
            List {
                Section("Platforms") {
                    ForEach(platforms,id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundColor(platform.color)
                        }
                    }
                }
                Section("GAMES") {
                    ForEach(games,id: \.name) { game in
                        NavigationLink(value: game) {
                            Label(game.name, systemImage: game.imageName)
                                .foregroundColor(game.color)
                        }
                    }
                }
                
                
            }.navigationTitle("Gaming")
                .navigationDestination(for: Game.self) { game in
                    ZStack {
                        game.color.ignoresSafeArea()
                        Label(game.name,systemImage: game.imageName)
                            .font(.largeTitle)
                            .bold()
                    }
                }
                .navigationDestination(for: Platform.self) { platform in
                    ZStack {
                        platform.color.ignoresSafeArea()
                        
                        VStack {
                            Label(platform.name,systemImage: platform.imageName)
                                .font(.largeTitle)
                                .bold()
                            
                            List {
                                ForEach(games,id: \.name) { game in
                                    NavigationLink(value: game) {
                                        Label(game.name, systemImage: game.imageName)
                                            .foregroundColor(game.color)
                                    }
                                }
                            }
                            
                            Button("go home", action: {
                                path.removeLast(path.count)
                            })
                        }
                        
                    }
                }
        }
    }
}

struct Gaming_Previews: PreviewProvider {
    static var previews: some View {
        Gaming()
    }
}

struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}

struct Game: Hashable {
    let name: String
    let imageName: String
    let color: Color
}
