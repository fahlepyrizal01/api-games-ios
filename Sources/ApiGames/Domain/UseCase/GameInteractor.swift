//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import Foundation
import RxSwift

class GameInteractor: GameUseCase {
    
    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }
    
    func getGames(isFromLocal: Bool) -> Observable<[GameModel]> {
        return repository.getGames(isFromLocal: isFromLocal)
    }
    
    func getGame(id: Int) -> Observable<GameModel> {
        return repository.getGameDetail(id: id)
    }
    
    func addGame(game: GameModel) -> Observable<Bool> {
        return repository.addGame(game: game)
    }
    
    func removeGame(id: Int) -> Observable<Bool> {
        return repository.removeGame(id: id)
    }
    
}
