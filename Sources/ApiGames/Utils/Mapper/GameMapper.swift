//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

final class GameMapper {
    
    static func mapGamesResponsesToDomain(input gamesResponses: [GameResponse]) -> [GameModel] {
        return gamesResponses.map { result in
            return GameModel(
                id: result.id ?? 0,
                name: result.name ?? "",
                slug: result.slug ?? "",
                backgroundImage: result.backgroundImage ?? "",
                website: result.website ?? "",
                descriptionRaw: result.descriptionRaw ?? "",
                released: result.released ?? "",
                rating: result.rating ?? 0.0,
                ratingTop: result.ratingTop ?? 0,
                ratingsCount: result.ratingsCount ?? 0,
                metacritic: result.metacritic ?? 0,
                platforms: mapPlatformResponseToDomain(input: result.platforms ?? [PlatformResponse(platform: CommonResponse(id: 0, name: "", image: ""))]),
                genres: mapCommonsResponseToDomain(input: result.genres ?? [CommonResponse(id: 0, name: "", image: "")]),
                shortScreenshots: mapCommonsResponseToDomain(input: result.shortScreenshots ?? [CommonResponse(id: 0, name: "", image: "")]),
                developers: mapCommonsResponseToDomain(input: result.developers ?? [CommonResponse(id: 0, name: "", image: "")]),
                publishers: mapCommonsResponseToDomain(input: result.publishers ?? [CommonResponse(id: 0, name: "", image: "")]),
                stores: mapStoremResponseToDomain(input: result.stores ?? [StoreResponse(store: CommonResponse(id: 0, name: "", image: ""))])
            )
        }
    }
    
    static func mapGamesEntityToDomain(input gamesEntity: [GameEntity]) -> [GameModel] {
        return gamesEntity.map { result in
            return GameModel(
                id: result.id,
                name: result.name,
                backgroundImage: result.backgroundImage,
                released: result.released,
                rating: result.rating,
                shortScreenshots: decodeShortScreenshots(shortScreenshots: result.shortScreenshots),
                isFavorite: result.isFavorite
            )
        }
    }
    
    static func mapGameDomainToEntity(input gameModel: GameModel) -> GameEntity {
        
        let gameEntity = GameEntity()
        gameEntity.id = gameModel.id
        gameEntity.name = gameModel.name
        gameEntity.backgroundImage = gameModel.backgroundImage
        gameEntity.released = gameModel.released
        gameEntity.rating = gameModel.rating
        gameEntity.shortScreenshots = encodeShortScreenshots(shortScreenshots: gameModel.shortScreenshots)
        gameEntity.isFavorite = gameModel.isFavorite
        
        return gameEntity
        
    }
    
    static func decodeShortScreenshots(shortScreenshots: String) -> [CommonModel] {
        var result = [CommonModel]()
        for (index, element) in shortScreenshots.components(separatedBy: ",").enumerated() {
            result.append(CommonModel(id: index, name: "", image: element))
        }
        return result
    }
    
    static func encodeShortScreenshots(shortScreenshots: [CommonModel]) -> String {
        var urls = [String]()
        shortScreenshots.forEach { url in
            urls.append(url.image)
        }
        return urls.joined(separator: ",")
    }
    
    static func mapPlatformResponseToDomain(input platformResponses: [PlatformResponse]) -> [PlatformModel] {
        return platformResponses.map { result in
            return PlatformModel(
                platform: mapCommonResponseToDomain(input: result.platform)
            )
        }
    }
    
    static func mapStoremResponseToDomain(input storeResponses: [StoreResponse]) -> [StoreModel] {
        return storeResponses.map { result in
            return StoreModel(
                store: mapCommonResponseToDomain(input: result.store)
            )
        }
    }
    
    static func mapCommonsResponseToDomain(input commonResponses: [CommonResponse]) -> [CommonModel] {
        return commonResponses.map { result in
            return CommonModel(
                id: result.id,
                name: result.name ?? "",
                image: result.image ?? ""
            )
        }
    }
    
    static func mapCommonResponseToDomain(input commonResponses: CommonResponse) -> CommonModel {
        return CommonModel(
            id: commonResponses.id,
            name: commonResponses.name ?? "",
            image: commonResponses.image ?? ""
        )
    }
    
    static func mapGameResponsesToDomain(input gameResponses: GameResponse, isFavorite: Bool) -> GameModel {
        return GameModel(
            id: gameResponses.id ?? 0,
            name: gameResponses.name ?? "",
            slug: gameResponses.slug ?? "",
            backgroundImage: gameResponses.backgroundImage ?? "",
            website: gameResponses.website ?? "",
            descriptionRaw: gameResponses.descriptionRaw ?? "",
            released: gameResponses.released ?? "",
            rating: gameResponses.rating ?? 0.0,
            ratingTop: gameResponses.ratingTop ?? 0,
            ratingsCount: gameResponses.ratingsCount ?? 0,
            metacritic: gameResponses.metacritic ?? 0,
            platforms: mapPlatformResponseToDomain(input: gameResponses.platforms ?? [PlatformResponse(platform: CommonResponse(id: 0, name: "", image: ""))]),
            genres: mapCommonsResponseToDomain(input: gameResponses.genres ?? [CommonResponse(id: 0, name: "", image: "")]),
            shortScreenshots: mapCommonsResponseToDomain(input: gameResponses.shortScreenshots ?? [CommonResponse(id: 0, name: "", image: "")]),
            developers: mapCommonsResponseToDomain(input: gameResponses.developers ?? [CommonResponse(id: 0, name: "", image: "")]),
            publishers: mapCommonsResponseToDomain(input: gameResponses.publishers ?? [CommonResponse(id: 0, name: "", image: "")]),
            stores: mapStoremResponseToDomain(input: gameResponses.stores ?? [StoreResponse(store: CommonResponse(id: 0, name: "", image: ""))]),
            isFavorite: isFavorite
        )
    }
    
}
