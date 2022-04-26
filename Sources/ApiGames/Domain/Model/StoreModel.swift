//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

public struct StoreModel: Codable {

    public init(store: CommonModel = CommonModel()) {
        self.store = store
    }

    public var store: CommonModel

}
