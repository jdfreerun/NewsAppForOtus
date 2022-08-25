//
//  Post.swift
//  NewsAppForOtus
//
//  Created by Albert Fayzullin on 25.08.2022.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
