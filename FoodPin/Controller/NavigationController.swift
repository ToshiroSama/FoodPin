//
//  NavigationController.swift
//  FoodPin
//
//  Created by 1 on 07/03/22.
//

import UIKit

class NavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
