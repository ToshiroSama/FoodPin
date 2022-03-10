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
        Restaurant(name: "Cafe Deadend", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", type: "Coffee & Tea Shop", image: "cafedeadend", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", isFavorite: false),
        Restaurant(name: "Homei", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", type: "Cafe", image: "homei", phone: "348-233423", description: "A little gem hidden at the corner of the street is nothing but fantastic! This place is warm and cozy. We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of coffee drinks and specialties including lattes, cappuccinos, teas, and more. We serve breakfast, lunch, and dinner in an airy open setting. Come over, have a coffee and enjoy a chit-chat with our baristas.", isFavorite: false),
        Restaurant(name: "Teakha", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", type: "Tea House", image: "teakha", phone: "354-243523", description: "Take a moment to stop and smell tealeaves! We are about the community, our environment, and all things created by the warmth of our hands. We open at 11 AM, and close at 7 PM. At teakha, we sell only the best single-origin teas sourced by our sister company Plantation directly from small tea plantations. The teas are then either cooked to perfection with milk in a pot or brewed.", isFavorite: false),
        Restaurant(name: "Cafe loisl", location: "Shop B, 20 Tai Ping Shan Road SOHO", type: "Austrian / Causual Drink", image: "cafeloisl", phone: "453-333423", description: "A great cafe in Austrian style. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. We also serve breakfast and light lunch. Come over to enjoy the elegant ambience and quality coffee.", isFavorite: false),
        Restaurant(name: "Petite Oyster", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", type: "French", image: "petiteoyster", phone: "983-284334", description: "An upscale dining venue, features premium and seasonal imported oysters, and delicate yet creative modern European cuisines. Its oyster bar displays a full array of freshest oysters imported from all over the world including France, Australia, USA and Japan.", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", type: "Bakery", image: "forkee", phone: "232-434222", description: "A great local cafe for breakfast and lunch! Located in a quiet area in Sheung Wan, we offer pork chop buns, HK french toast, and many more. We open from 7 AM to 4:30 PM.", isFavorite: false),
        Restaurant(name: "Po's Atelier", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", type: "Bakery", image: "posatelier", phone: "234-834322", description: "A boutique bakery focusing on artisan breads and pastries paired with inspiration from Japan and Scandinavia. We are crazy about bread and excited to share our artisan bakes with you. We open at 10 every morning, and close at 7 PM.", isFavorite: false),
        Restaurant(name: "Bourke Street Backery", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", type: "Chocolate", image: "bourkestreetbakery", phone: "982-434343", description: "We make everything by hand with the best possible ingredients, from organic sourdoughs to pastries and cakes. A combination of great produce, good strong coffee, artisanal skill and hard work creates the honest, soulful, delectable bites that have made Bourke Street Bakery famous. Visit us at one of our many Sydney locations!", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", location: "412-414 George St Sydney New South Wales", type: "Cafe", image: "haigh", phone: "734-232323", description: "Haigh's Chocolates is Australia's oldest family owned chocolate maker. We have been making chocolate in Adelaide, South Australia since 1915 and we are committed to the art of premium chocolate making from the cocoa bean. Our chocolates are always presented to perfection in our own retail stores. Visit any one of them and you'll find chocolate tasting, gift wrapping and personalised attention are all part of the service.", isFavorite: false),
        Restaurant(name: "Palomino Espresso", location: "Shop 1 61 York St Sydney New South Wales", type: "American / Seafood", image: "palomino", phone: "872-734343", description: "We offer an assortment of on-site baked goods and sandwiches. This place has always been a favourite among office workers. We open at 7 every morning including Sunday, and close at 4 PM. Come over, have a coffee and enjoy a chit-chat with our baristas.", isFavorite: false),
        Restaurant(name: "Upstate", location: "95 1st Ave New York, NY 10003", type: "American", image: "upstate", phone: "343-233221", description: "The absolute best seafood place in town. The atmosphere here creates a very homey feeling. We open at 5 PM, and close at 10:30 PM.", isFavorite: false),
        Restaurant(name: "Traif", location: "229 S 4th St Brooklyn, NY 11211", type: "American", image: "traif", phone: "985-723623", description: "A young crowd populates this pork-focused American eatery in an older Williamsburg neighborhood. We open at 6PM, and close at 11 PM. If you enjoy a shared small plates dinner experience, come over and have a try.", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", location: "445 Graham Ave Brooklyn, NY 11211", type: "Breakfast & Brunch", image: "graham", phone: "455-232345", description: "Classic Italian deli & butcher draws patrons with meat-filled submarine sandwiches. We use the freshest meats and veggies to create the perfect panini for you. We look forward to seeing you!", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", location: "413 Graham Ave Brooklyn, NY 11211", type: "Coffee & Tea", image: "waffleandwolf", phone: "434-232322", description: "Small shop, some seating, definitely something different! We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of waffles with choices of sweet & savory fillings. If you are gluten free and craving waffles, this is the place to go.", isFavorite: false),
        Restaurant(name: "Five Leaves", location: "18 Bedford Ave Brooklyn, NY 11222", type: "Coffee & Tea", image: "fiveleaves", phone: "343-234553", description: "Great food, cocktails, ambiance, service. Nothing beats having a warm dinner and a whiskey. We open at 8 every morning, and close at 1 AM. The ricotta pancakes are something you must try.", isFavorite: false),
        Restaurant(name: "Cafe Lore", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", type: "Latin American", image: "cafelore", phone: "342-455433", description: "Good place, great environment and amazing food! We open at 10 every morning except Sunday, and close at 9 PM. Give us a visit! Enjoy mushroom raviolis, pumpkin raviolis, meat raviolis with sausage and peppers, pork cutlets, eggplant parmesan, and salad.", isFavorite: false),
        Restaurant(name: "Confessional", location: "308 E 6th St New York, NY 10003", type: "Spanish", image: "confessional", phone: "643-332323", description: "Most delicious cocktail you would ever try! Our menu includes a wide range of high quality internationally inspired dishes, vegetarian options, and local cuisine. We open at 10 AM, and close at 10 PM. We welcome you into our place to enjoy a meal with your friends.", isFavorite: false),
        Restaurant(name: "Barrafina", location: "54 Frith Street London W1D 4SL United Kingdom", type: "Spanish", image: "barrafina", phone: "542-343434", description: "A collection of authentic Spanish Tapas bars in Central London! We have an open kitchen, a beautiful marble-topped bar where guests can sit and watch the chefs at work and stylish red leather stools. Lunch starts at 1 PM. Dinners starts 5:30 PM.", isFavorite: false),
        Restaurant(name: "Donostia", location: "10 Seymour Place London W1H 7ND United Kingdom", type: "Spanish", image: "donostia", phone: "722-232323", description: "Very good basque food, creative dishes with terrific flavors! Donostia is a high end tapas restaurant with a friendly relaxed ambiance. Come over to enjoy awesome tapas!", isFavorite: false),
        Restaurant(name: "Royal Oak", location: "2 Regency Street London SW1P 4BZ United Kingdom", type: "British", image: "royaloak", phone: "343-988834", description: "Specialise in great pub food. Established in 1872, we have local and world lagers, craft beer and a selection of wine and spirits for people to enjoy. Don't forget to try our range of Young's Ales and Fish and Chips.", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", location: "22 Charlwood Street London SW1V 2DY Pimlico", type: "Thai", image: "cask", phone: "432-344050", description: "With kitchen serving gourmet burgers. We offer food every day of the week, Monday through to Sunday. Join us every Sunday from 4:30 – 7:30pm for live acoustic music!", isFavorite: false)
    ]
                            
    lazy var dataSource = configureDataSource()
    
    // MARK: - View Controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the data source of the table view
        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        
        // Create a snapshot and populate the data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurants, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        // Enable large title for navigation bar
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.backButtonTitle = ""
        
        // Customize the navigation bar appearance
        if let appearance = navigationController?.navigationBar.standardAppearance {
            
            appearance.configureWithTransparentBackground()
            
            if let customFont = UIFont(name: "Nunito-Bold", size: 45.0) {
                
                appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!, .font: customFont]
            }
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // To hide the bars on swipe
        navigationController?.hidesBarsOnSwipe = true
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
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
            
            // For IPad
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        // Change the button's color
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
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant = self.restaurants[indexPath.row]
            }
        }
    }
    
}
