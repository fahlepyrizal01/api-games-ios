//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import Foundation
import RxSwift

protocol GameRemoteDataSourceProtocol: AnyObject {
    
    func getGames() -> Observable<[GameResponse]>
    func getGameDetail(id: Int) -> Observable<GameResponse>
    
}
