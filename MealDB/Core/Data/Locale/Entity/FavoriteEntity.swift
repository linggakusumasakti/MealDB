//
//  FavoriteEntity.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 14/12/21.
//

import Foundation
import RealmSwift

class FavoriteEntity: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var image = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
