//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

struct PlatformResponse: Codable {
    
    let platform: CommonResponse
    
    enum CodingKeys: String, CodingKey {
        case platform
    }
    
}
