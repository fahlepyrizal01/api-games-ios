//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import Foundation
import RxSwift

protocol GameLocalDataSourceProtocol: AnyObject {
    
    func getGames() -> Observable<[GameEntity]>
    func getGameDetail(id: Int) -> Observable<GameEntity>
    func addGame(from games: GameEntity) -> Observable<Bool>
    func removeGame(from id: Int) -> Observable<Bool>
    
}
