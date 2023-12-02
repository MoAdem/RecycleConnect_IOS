//
//  News.swift
//  RecycleConnect_IOS
//
//  Created by Med adem on 2/12/2023.
//

import Foundation

struct News: Identifiable, Decodable {
    var id: String { _id }
    
    let _id: String
    let title: String
    let newsPhoto: String
    let description: String
    let source: String
}
struct NewsResponse: Decodable {
    let success: Bool
    let news: [News]
}

struct MockDataNews {
    //give me sample data
    static let sampleNews = News(_id: "1", title: "aaaaaaaaa", newsPhoto: "newsPhoto", description: "dzdzdzdzd", source: "fafafafazf")
    
}
