//
//  VideoListView.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/5/23.
//

import SwiftUI

struct VideoListView: View {
    
    var videos: [Video] = VideoList.topTen
    
    var body: some View{
        NavigationView{
            List(videos,id: \.id) { video in
                
                NavigationLink(destination: VideoDetailsView(video: video), label: {
                    HStack {
                       
                        Image(video.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .cornerRadius(4)
                            .padding(.vertical,5)
                            
                        VStack(alignment: .leading,spacing: 8) {
                            Text(video.title)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                            
                        Text(video.uploadDate)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                })
                
        
              
                
            }.navigationTitle("Sean's Top 10")
        }
       
      
            
    }
    
}

struct Previews_VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
