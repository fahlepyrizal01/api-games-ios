//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

struct GameResponse: Codable {
    
    var id: Int?
    var name, slug, backgroundImage, website, descriptionRaw, released: String?
    var rating: Double?
    var ratingTop, ratingsCount, metacritic: Int?
    var platforms: [PlatformResponse]?
    var genres, shortScreenshots, developers, publishers: [CommonResponse]?
    var stores: [StoreResponse]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug, released, rating, platforms, genres, stores, website, metacritic, developers, publishers
        case backgroundImage = "background_image"
        case ratingTop = "rating_top"
        case ratingsCount = "ratings_count"
        case shortScreenshots = "short_screenshots"
        case descriptionRaw = "description_raw"
    }
    
}
