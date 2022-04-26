//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

struct CommonResponse: Codable {
    
    let id: Int
    let name: String?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, image
    }
    
}
