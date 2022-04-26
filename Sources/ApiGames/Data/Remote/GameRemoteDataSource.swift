//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

import Foundation
import Alamofire
import RxSwift

final class GameRemoteDataSource: NSObject {
    
    private override init() { }
    
    static let sharedInstance: GameRemoteDataSource =  GameRemoteDataSource()
    
}

extension GameRemoteDataSource: GameRemoteDataSourceProtocol {
    
    func getGames() -> Observable<[GameResponse]> {
        
        return Observable<[GameResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.games.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: GamesResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
        
    }
    
    func getGameDetail(id: Int) -> Observable<GameResponse> {
        return Observable<GameResponse>.create { observer in
            if let url = URL(string: Endpoints.Gets.detail.url.replacingOccurrences(of: "id", with: String(id))) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: GameResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
}
