//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by 1 on 21/02/22.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    // Creating a variable named restaurants it is extended from Restraurant struct
    var restaurants: [Restaurant] = [
        Restaurant(name: "Cafe Deadend", location: "Coffee & Tea Shop", type: "Hong Kong", image: "cafedeadend", isFavorite: false),
        Restaurant(name: "Homei", location: "Hong Kong", type: "Cafe", image:
        "homei", isFavorite: false),
            Restaurant(name: "Teakha", location: "Hong Kong", type: "Tea House", image: "teakha", isFavorite: false),
            Restaurant(name: "Cafe loisl", location: "Hong Kong", type: "Austrian / Causual Drink", image: "cafeloisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", location: "Hong Kong", type: "French", image: "petiteoyster", isFavorite: false),
            Restaurant(name: "For Kee Restaurant", location: "Hong Kong", type: "Bakery", image: "forkee", isFavorite: false),
            Restaurant(name: "Po's Atelier", location: "Hong Kong", type: "Bakery", image: "posatelier", isFavorite: false),
            Restaurant(name: "Bourke Street Backery", location: "Sydney", type: "Chocolate", image: "bourkestreetbakery", isFavorite: false),
            Restaurant(name: "Haigh's Chocolate", location: "Sydney", type: "Cafe", image: "haigh", isFavorite: false),
            Restaurant(name: "Palomino Espresso", location: "Sydney", type: "American / Seafood", image: "palomino", isFavorite: false),
            Restaurant(name: "Upstate", location: "New York", type: "American", image: "upstate", isFavorite: false),
            Restaurant(name: "Traif", location: "New York", type: "American", image: "traif", isFavorite: false),
            Restaurant(name: "Graham Avenue Meats", location: "New York", type: "Breakfast & Brunch", image: "graham", isFavorite: false),
            Restaurant(name: "Waffle & Wolf", location: "New York", type: "Coffee & Tea", image: "waffleandwolf", isFavorite: false),
            Restaurant(name: "Five Leaves", location: "New York", type: "Coffee & Tea", image: "fiveleaves", isFavorite: false),
            Restaurant(name: "Cafe Lore", location: "New York", type: "Latin American", image: "cafelore", isFavorite: false),
            Restaurant(name: "Confessional", location: "New York", type: "Spanish", image: "confessional", isFavorite: false),
            Restaurant(name: "Barrafina", location: "London", type: "Spanish", image: "barrafina", isFavorite: false),
            Restaurant(name: "Donostia", location: "London", type: "Spanish", image: "donostia", isFavorite: false),
            Restaurant(name: "Royal Oak", location: "London", type: "Britain", image: "royaloak", isFavorite: false),
            Restaurant(name: "CASK Pub and Kitchen", location: "London", type: "Thai", image: "cask", isFavorite: false)
    ]
                            
    lazy var dataSource = configureDataSource()
    
    // MARK: - View Controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        tableView.separatorStyle = .none
        
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurants, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }
    
    // MARK: - UITableView Diffable Data Source
    
    func configureDataSource() -> RestaurantDiffableDataSource {
        
        let cellIdentifier = "Cell"
        
        let dataSource = RestaurantDiffableDataSource (
                tableView: tableView,
                cellProvider: {  tableView, indexPath, restaurant in
                    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
                    cell.nameLabel.text = restaurant.name
                    cell.locationLabel.text = restaurant.location
                    cell.typeLabel.text = restaurant.type
                    cell.thumbnailImageView.image = UIImage(named: restaurant.image)
                    
                    cell.favoriteImageView.isHidden = self.restaurants[indexPath.row].isFavorite ? false : true
        
                    return cell
                }
        )
        return dataSource
    }
    
    // MARK: - UITableViewDelegate Protocol
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        // Add "Reverse a table" section
        let reserveActionHandler = { (action: UIAlertAction!) -> Void in
            
            let alertMessage = UIAlertController(title: "Not available yet", message: "Sorry, this feature is not available yet. Please try later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let reserveAction = UIAlertAction(title: "Reserve a table", style: .default, handler: reserveActionHandler)
        optionMenu.addAction(reserveAction)
        
        // Mark as favorite action
        let favoriteActionTitle = self.restaurants[indexPath.row].isFavorite ? "Remove from favorites" : "Mark as favorite"
        let favoriteAction = UIAlertAction(title: favoriteActionTitle, style: .default, handler: { (action: UIAlertAction!) -> Void in
                
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            
            cell.favoriteImageView.isHidden = self.restaurants[indexPath.row].isFavorite
            
            self.restaurants[indexPath.row].isFavorite = self.restaurants[indexPath.row].isFavorite ? false : true
        })
        optionMenu.addAction(favoriteAction)
        
        // Display the menu
        present(optionMenu, animated: true, completion: nil)
        
        // Deselect the row
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Get the selected restaurant
        guard let restaurant = self.dataSource.itemIdentifier(for: indexPath) else {
            return UISwipeActionsConfiguration()
        }
        
        // Delete Action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
                
            var snapshot = self.dataSource.snapshot()
            snapshot.deleteItems([restaurant])
            self.dataSource.apply(snapshot, animatingDifferences: true)
            
            // Call completion handler to dismiss the action button
            completionHandler(true)
        }
        
        // Share Action
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            
            
            let defaultText = "Just checking in at " + restaurant.name
            
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: restaurant.image) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        shareAction.backgroundColor = UIColor.systemOrange
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        deleteAction.backgroundColor = UIColor.systemRed
        deleteAction.image = UIImage(systemName: "trash")
        
        // Configure both actions as swipe action
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Mark as favorite action
        let favoriteAction = UIContextualAction(style: .destructive, title: "") { (action, sourceView, completionHandler) in
            
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell

            cell.favoriteImageView.isHidden = self.restaurants[indexPath.row].isFavorite
            
            self.restaurants[indexPath.row].isFavorite = self.restaurants[indexPath.row].isFavorite ? false : true
            
            // Call completion handler to dismiss the action button
            completionHandler(true)
        }
        
        // Configure swipe action
        favoriteAction.backgroundColor = UIColor.systemYellow
        favoriteAction.image = UIImage(systemName: self.restaurants[indexPath.row].isFavorite ? "heart.slash.fill" : "heart.fill")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [favoriteAction])
            
        return swipeConfiguration
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
