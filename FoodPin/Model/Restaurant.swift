//
//  Restaurant.swift
//  FoodPin
//
//  Created by 1 on 26/02/22.
//

import Foundation

struct Restaurant: Hashable {
    var name: String
    var location: String
    var type: String
    var image: String
    var isFavorite: Bool
    
    init (name: String, location: String, type: String, image: String, isFavorite: Bool) {
        self.name = name
        self.location = location
        self.type = type
        self.image = image
        self.isFavorite = isFavorite
    }
    
    init() {
        self.init(name: "", location: "", type: "", image: "", isFavorite: false)
    }
}
