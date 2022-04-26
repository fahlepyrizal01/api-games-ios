//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import Foundation
import RxSwift

public protocol GameUseCase {
    
    func getGames(isFromLocal: Bool) -> Observable<[GameModel]>
    func getGame(id: Int) -> Observable<GameModel>
    func addGame(game: GameModel) -> Observable<Bool>
    func removeGame(id: Int) -> Observable<Bool>
    
}
