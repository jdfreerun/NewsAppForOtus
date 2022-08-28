//
//  Post.swift
//  NewsAppForOtus
//
//  Created by Albert Fayzullin on 25.08.2022.
//

import Foundation

import Foundation

// MARK: - Post
struct Post: Decodable {
    let category: String
    let data: [Datum]
    let success: Bool
}

// MARK: - Datum
struct Datum: Decodable {
    let author, content: String
    let date: String
    let id: String
    let imageURL: String
    let time, title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case author, content, date, id
        case imageURL = "imageUrl"
        case time, title, url
    }
}
