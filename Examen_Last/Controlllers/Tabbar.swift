//
//  Tabbar.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

class Tabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    func setupTabbar() {
        
        let vc1 = MainVC.init(nibName: "MainVC", bundle: nil)
        let navVC1 = UINavigationController(rootViewController: vc1)
        let item1 = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        navVC1.tabBarItem = item1
        
        let vc2 = UIViewController()
        let navVC2 = UINavigationController(rootViewController: vc2)
        let item2 = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        navVC2.tabBarItem = item2
        
        let vc3 = UIViewController()
        let navVC3 = UINavigationController(rootViewController: vc3)
        let item3 = UITabBarItem(title: "Избранные", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        navVC3.tabBarItem = item3
        
        let vc4 = UIViewController()
        let navVC4 = UINavigationController(rootViewController: vc4)
        let item4 = UITabBarItem(title: "Чаты", image: UIImage(systemName: "message"), selectedImage: UIImage(systemName: "message.fill"))
        navVC4.tabBarItem = item4
        
        let vc5 = UIViewController()
        let navVC5 = UINavigationController(rootViewController: vc5)
        let item5 = UITabBarItem(title: "Кабинет", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        navVC5.tabBarItem = item5
        
        viewControllers = [navVC1,navVC2,navVC3,navVC4,navVC5]
      
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.03921568627, green: 0.5137254902, blue: 0.4235294118, alpha: 1)
        //  UITabBar.appearance().barTintColor = .defaultGray
    }
}
