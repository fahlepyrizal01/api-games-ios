//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

struct GamesResponse: Codable {
    
    let results: [GameResponse]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
}
