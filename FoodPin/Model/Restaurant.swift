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
    var phone: String
    var description: String
    var isFavorite: Bool
    
    init (name: String, location: String, type: String, image: String, phone: String, description: String, isFavorite: Bool) {
        self.name = name
        self.location = location
        self.type = type
        self.image = image
        self.phone = phone
        self.description = description
        self.isFavorite = isFavorite
    }
    
    init() {
        self.init(name: "", location: "", type: "", image: "", phone: "", description: "", isFavorite: false)
    }
}
