//
//  ViewController.swift
//  CalendarByDi
//
//  Created by Diana Nikulina on 20.04.2023.
//

import UIKit

class MainTableConrtoller: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
setupTabBar()
    }
    
    func setupTabBar(){
        let calendarViewController = createNavigateController(vc: CalendarConrtoller(), itemName: "Calendar", itemImage: "calendar")
        let descriptionViewController = createNavigateController(vc: DescriptionViewConrtoller(), itemName: "Description", itemImage: "rectangle.and.pencil.and.ellipsis")
        
        viewControllers = [calendarViewController,descriptionViewController]
    }
    
    func createNavigateController(vc:UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        let navigateController = UINavigationController(rootViewController: vc)
        navigateController.tabBarItem = item
        return navigateController
    }

}

