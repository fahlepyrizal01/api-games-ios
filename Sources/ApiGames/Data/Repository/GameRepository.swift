//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

import Foundation
import RxSwift

final class GameRepository: NSObject {
    
    typealias GameInstance = (GameLocalDataSource, GameRemoteDataSource) -> GameRepository
    
    fileprivate let local: GameLocalDataSource
    fileprivate let remote: GameRemoteDataSource
    
    private init(local: GameLocalDataSource, remote: GameRemoteDataSource) {
        self.remote = remote
        self.local = local
    }
    
    static let sharedInstance: GameInstance = { localRepo, remoteRepo in
        return GameRepository(local: localRepo, remote: remoteRepo)
    }
    
}

extension GameRepository: GameRepositoryProtocol {
    
    func getGames(isFromLocal: Bool) -> Observable<[GameModel]> {
        if isFromLocal {
            return self.local.getGames().map {
                GameMapper.mapGamesEntityToDomain(input: $0)
            }
        } else {
            return self.remote.getGames().map {
                GameMapper.mapGamesResponsesToDomain(input: $0)
            }
        }
    }
    
    func getGameDetail(id: Int) -> Observable<GameModel> {
        return self.local.getGameDetail(id: id).flatMap { gameEntity in
            self.remote.getGameDetail(id: id).map {
                GameMapper.mapGameResponsesToDomain(input: $0, isFavorite: gameEntity.isFavorite)
            }
        }
    }
    
    func addGame(game: GameModel) -> Observable<Bool> {
        return self.local.addGame(from: GameMapper.mapGameDomainToEntity(input: game))
    }
    
    func removeGame(id: Int) -> Observable<Bool> {
        return self.local.removeGame(from: id)
    }
    
}
