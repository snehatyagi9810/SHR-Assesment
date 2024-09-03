//
//  DataModel.swift
//  SHR Assesment
//
//  Created by Sneh  on 29/08/24.
//

import Foundation



// MARK: - Welcome
struct DataModel: Codable {
    let status: Int
    let message: String
    let data: ArticleModel
}

// MARK: - ArticleModel
struct ArticleModel: Codable {
    let totalCount: Int
    let data: [Article]
}

// MARK: - Article
struct Article: Codable {
    let description, status: String?
    let feedDate: String?
    let cityName: String?
    let feedUserName: String?
    let feedUserPic: String?
    let totalComments, totalLikes: Int?
    let story_img: String?
    let feed_type_name: String?
    let name: String?
    let id: Int
}


