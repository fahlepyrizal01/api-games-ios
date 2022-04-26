//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

struct StoreResponse: Codable {
    
    let store: CommonResponse
    
    enum CodingKeys: String, CodingKey {
        case store
    }
    
}
