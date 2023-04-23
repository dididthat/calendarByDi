//
//  ViewController.swift
//  CalendarByDi
//
//  Created by Diana Nikulina on 20.04.2023.
//

import UIKit

final class MainTableConrtoller: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    #warning("Добавить картинки")
    private func setupTabBar(){
        let calendarViewController = createNavigationController(vc: CalendarViewController(), itemName: "Calendar", itemImage: "calendar")
        let descriptionViewController = createNavigationController(vc: DescriptionViewConrtoller(), itemName: "Description", itemImage: "rectangle.and.pencil.and.ellipsis")
        
        viewControllers = [calendarViewController,descriptionViewController]
    }
    
    private func createNavigationController(vc:UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: nil, tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem = item
        return navigationController
    }

}

