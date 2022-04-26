//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

public struct GameModel: Codable {

    public init(
        id: Int = 0,
        name: String = "",
        slug: String = "",
        backgroundImage: String = "",
        website: String = "",
        descriptionRaw: String = "",
        released: String = "",
        rating: Double = 0.0,
        ratingTop: Int = 0,
        ratingsCount: Int = 0,
        metacritic: Int = 0,
        platforms: [PlatformModel] = [PlatformModel()],
        genres: [CommonModel] = [CommonModel()],
        shortScreenshots: [CommonModel] = [CommonModel()],
        developers: [CommonModel] = [CommonModel()],
        publishers: [CommonModel] = [CommonModel()],
        stores: [StoreModel] = [StoreModel()],
        isFavorite: Bool = false
    ) {
        self.id = id
        self.name = name
        self.slug = slug
        self.backgroundImage = backgroundImage
        self.website = website
        self.descriptionRaw = descriptionRaw
        self.released = released
        self.rating = rating
        self.ratingTop = ratingTop
        self.ratingsCount = ratingsCount
        self.metacritic = metacritic
        self.platforms = platforms
        self.genres = genres
        self.shortScreenshots = shortScreenshots
        self.developers = developers
        self.publishers = publishers
        self.stores = stores
        self.isFavorite = isFavorite
    }

    public var id: Int
    public var name: String
    public var slug: String
    public var backgroundImage: String
    public var website: String
    public var descriptionRaw: String
    public var released: String
    public var rating: Double
    public var ratingTop: Int
    public var ratingsCount: Int
    public var metacritic: Int
    public var platforms: [PlatformModel]
    public var genres: [CommonModel]
    public var shortScreenshots: [CommonModel]
    public var developers: [CommonModel]
    public var publishers: [CommonModel]
    public var stores: [StoreModel]
    public var isFavorite: Bool

}
