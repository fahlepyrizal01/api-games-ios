//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

import Foundation
import RealmSwift
import RxSwift

final class GameLocalDataSource: NSObject {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
        
    }
    
    static let sharedInstance: (Realm?) -> GameLocalDataSource = { realmDatabase in
        return GameLocalDataSource(realm: realmDatabase)
    }
    
}

extension GameLocalDataSource: GameLocalDataSourceProtocol {
    
    func getGames() -> Observable<[GameEntity]> {
        
        return Observable<[GameEntity]>.create { observer in
            if let realm = self.realm {
                let games: Results<GameEntity> = {
                    realm.objects(GameEntity.self)
                }()
                observer.onNext(games.toArray(ofType: GameEntity.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
        
    }
    
    func getGameDetail(id: Int) -> Observable<GameEntity> {
        
        return Observable<GameEntity>.create { observer in
            if let realm = self.realm {
                let game: GameEntity = {
                    realm.object(ofType: GameEntity.self, forPrimaryKey: id)
                }() ?? GameEntity()
                observer.onNext(game)
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
        
    }
    
    
    func addGame(from game: GameEntity) -> Observable<Bool> {
        
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(game, update: .all)
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
                
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
        
    }
    
    func removeGame(from id: Int) -> Observable<Bool> {
        
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.delete(realm.objects(GameEntity.self).filter("id=%@", id))
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
                
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
        
    }
    
    
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
    
}
