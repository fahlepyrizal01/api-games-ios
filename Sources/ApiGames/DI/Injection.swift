//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import Foundation
import RealmSwift

public final class Injection: NSObject {
    
    private func provideRepository() -> GameRepositoryProtocol {
        
        let realm = try? Realm()
        let local: GameLocalDataSource = GameLocalDataSource.sharedInstance(realm)
        let remote: GameRemoteDataSource = GameRemoteDataSource.sharedInstance
        return GameRepository.sharedInstance(local, remote)
        
    }
    
    public func provideGame() -> GameUseCase {
        let repository = provideRepository()
        return GameInteractor(repository: repository)
    }
    
}
