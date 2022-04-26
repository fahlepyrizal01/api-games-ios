//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import Foundation

struct API {
    
    static let baseUrl = "https://api.rawg.io/api/games"
    static let apiKey = "key=d68423c7fe984982911f09c4dcda5d07"
    static let pageSize = "page_size=20"
    
}

protocol Endpoint {
    
    var url: String { get }
    
}

enum Endpoints {
    
    enum Gets: Endpoint {
        case games
        case detail
        
        public var url: String {
            switch self {
            case .games: return "\(API.baseUrl)?\(API.pageSize)&\(API.apiKey)"
            case .detail: return "\(API.baseUrl)/id?\(API.apiKey)"
            }
        }
        
    }
    
}
