//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

public struct PlatformModel: Codable {

    public init(platform: CommonModel = CommonModel()) {
        self.platform = platform
    }

    public var platform: CommonModel
}
