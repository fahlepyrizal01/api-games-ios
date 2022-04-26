//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 25/04/22.
//

import Foundation
import RealmSwift

class GameEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var backgroundImage: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var shortScreenshots: String = ""
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var isFavorite: Bool = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
