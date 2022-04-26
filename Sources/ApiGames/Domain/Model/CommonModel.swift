//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

public struct CommonModel: Codable {

    public init(id: Int = 0, name: String = "", image: String = "") {
        self.id = id
        self.name = name
        self.image = image
    }

    public var id: Int
    public var name: String
    public var image: String

}
