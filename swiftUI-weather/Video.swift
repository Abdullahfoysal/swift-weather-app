//
//  Video.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/5/23.
//

import SwiftUI

struct Video: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let viewCount: Int
    let uploadDate: String
    let url: URL
}



struct VideoList {
    static let topTen = [
        Video(imageName: "image1", title: "9 Things I Wish I knew When I started Programming", description: "In this Video I discuss 9 things I wish knew before I started programming. Knowing these things", viewCount: 2345, uploadDate: "February 18,2022", url: URL(string: "https://youtu.be/EgpKu1tAVMY")!),
                         Video(imageName: "image1", title: "9 Things I Wish I knew When I started Programming", description: "In this Video I discuss 9 things I wish knew before I started programming. Knowing these things", viewCount: 2345, uploadDate: "February 17,2022", url: URL(string: "https://youtu.be/EgpKu1tAVMY")!),
                         Video(imageName: "image1", title: "9 Things I Wish I knew When I started Programming", description: "In this Video I discuss 9 things I wish knew before I started programming. Knowing these things", viewCount: 2345, uploadDate: "February 17,2022", url: URL(string: "https://youtu.be/EgpKu1tAVMY")!),
                         Video(imageName: "image1", title: "9 Things I Wish I knew When I started Programming", description: "In this Video I discuss 9 things I wish knew before I started programming. Knowing these things", viewCount: 2345, uploadDate: "February 17,2022", url: URL(string: "https://youtu.be/EgpKu1tAVMY")!),
                         Video(imageName: "image1", title: "9 Things I Wish I knew When I started Programming", description: "In this Video I discuss 9 things I wish knew before I started programming. Knowing these things", viewCount: 2345, uploadDate: "February 17,2022", url: URL(string: "https://youtu.be/EgpKu1tAVMY")!),
                         Video(imageName: "image1", title: "9 Things I Wish I knew When I started Programming", description: "In this Video I discuss 9 things I wish knew before I started programming. Knowing these things", viewCount: 2345, uploadDate: "February 17,2022", url: URL(string: "https://youtu.be/EgpKu1tAVMY")!),
        Video(imageName: "image1", title: "9 Things I Wish I knew When I started Programming", description: "In this Video I discuss 9 things I wish knew before I started programming. Knowing these things", viewCount: 2345, uploadDate: "February 17,2022", url: URL(string: "https://youtu.be/EgpKu1tAVMY")!),
        Video(imageName: "image1", title: "9 Things I Wish I knew When I started Programming", description: "In this Video I discuss 9 things I wish knew before I started programming. Knowing these things", viewCount: 2345, uploadDate: "February 17,2022", url: URL(string: "https://youtu.be/EgpKu1tAVMY")!), Video(imageName: "image1", title: "9 Things I Wish I knew When I started Programming", description: "In this Video I discuss 9 things I wish knew before I started programming. Knowing these things", viewCount: 2345, uploadDate: "February 17,2022", url: URL(string: "https://youtu.be/EgpKu1tAVMY")!),
        Video(imageName: "image1", title: "9 Things I Wish I knew When I started Programming", description: "In this Video I discuss 9 things I wish knew before I started programming. Knowing these things", viewCount: 2345, uploadDate: "February 17,2022", url: URL(string: "https://youtu.be/EgpKu1tAVMY")!),]
}
