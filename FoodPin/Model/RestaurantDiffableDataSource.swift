//
//  RestaurantDiffableDataSource.swift
//  FoodPin
//
//  Created by 1 on 28/02/22.
//

import UIKit

enum Section {
    case all
}

class RestaurantDiffableDataSource: UITableViewDiffableDataSource<Section, Restaurant> {
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
