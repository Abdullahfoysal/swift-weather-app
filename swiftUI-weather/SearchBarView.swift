//
//  SearchBarView.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/24/23.
//

import SwiftUI

struct SearchBarView: View {
    @State private var followers: [Follower] = []
    @State private var searchTerm = ""
    
    var filteredFollowers: [Follower] {
        guard !searchTerm.isEmpty else { return followers}
        return followers.filter {
            $0.login.localizedCaseInsensitiveContains(searchTerm)
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredFollowers, id: \.self){ follower in
                HStack {
                    AsyncImage(url: URL(string: follower.avatarUrl)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle()
                            .foregroundColor(.secondary)
                    }
                    .frame(width: 44, height: 44)
                    Text(follower.login)
                        .font(.title3)
                        .fontWeight(.medium)
                }
            }
            .navigationTitle("Followers")
            .task {
                followers = await getFollowers()
            }
            .searchable(text: $searchTerm, prompt: "Search Followers")
        }
    }
    func getFollowers() async -> [Follower] {
        let url = URL(string: "https://api.github.com/users/abdullahfoysal/followers?per_page=100")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! decoder.decode([Follower].self, from: data)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}

struct Follower: Hashable, Codable {
    let avatarUrl: String
    let login: String
}
