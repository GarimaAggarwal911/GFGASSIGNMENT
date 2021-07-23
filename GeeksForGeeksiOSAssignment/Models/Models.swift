//
//  Models.swift
//  GeeksForGeeksiOSAssignment
//
//  Created by Vibes Com on 23/07/21.
//  Copyright © 2021 garima. All rights reserved.
//

import Foundation


struct Items : Codable {
    let title : String?
    let pubDate : String?
    let link : String?
    let guid : String?
    let author : String?
    let thumbnail : String?
    let description : String?
    let content : String?
    let enclosure : Enclosure?
    let categories : [String]?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case pubDate = "pubDate"
        case link = "link"
        case guid = "guid"
        case author = "author"
        case thumbnail = "thumbnail"
        case description = "description"
        case content = "content"
        case enclosure = "enclosure"
        case categories = "categories"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        pubDate = try values.decodeIfPresent(String.self, forKey: .pubDate)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        guid = try values.decodeIfPresent(String.self, forKey: .guid)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        content = try values.decodeIfPresent(String.self, forKey: .content)
        enclosure = try values.decodeIfPresent(Enclosure.self, forKey: .enclosure)
        categories = try values.decodeIfPresent([String].self, forKey: .categories)
    }

}
struct Enclosure : Codable {
    let link : String?
    let type : String?
    let thumbnail : String?

    enum CodingKeys: String, CodingKey {

        case link = "link"
        case type = "type"
        case thumbnail = "thumbnail"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
    }

}
struct Feed : Codable {
    let url : String?
    let title : String?
    let link : String?
    let author : String?
    let description : String?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case url = "url"
        case title = "title"
        case link = "link"
        case author = "author"
        case description = "description"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
struct NewsFeed : Codable {
    let status : String?
    let feed : Feed?
    let items : [Items]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case feed = "feed"
        case items = "items"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        feed = try values.decodeIfPresent(Feed.self, forKey: .feed)
        items = try values.decodeIfPresent([Items].self, forKey: .items)
    }

}
