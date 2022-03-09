//
//  Restaurant.swift
//  FoodPin
//
//  Created by 1 on 26/02/22.
//

import Foundation

struct Restaurant: Hashable {
    
    enum Rating: String {
        case awesome
        case good
        case okay
        case bad
        case terrible
        
        var image: String {
            switch self {
            case .awesome:
                return "love"
            case .good:
                return "cool"
            case .okay:
                return "happy"
            case .bad:
                return "sad"
            case .terrible:
                return "angry"
            }
        }
    }
    
    var name: String = ""
    var location: String = ""
    var type: String = ""
    var image: String = ""
    var phone: String = ""
    var description: String = ""
    var isFavorite: Bool = false
    var rating: Rating?
}
