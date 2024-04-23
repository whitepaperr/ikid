//
//  TabBarController.swift
//  iKid
//
//  Created by 이하은 on 4/22/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let goodJokeVC = JokeViewController(category: .good)
        goodJokeVC.tabBarItem = UITabBarItem(title: "Good", image: nil, tag: 0)

        let punJokeVC = JokeViewController(category: .pun)
        punJokeVC.tabBarItem = UITabBarItem(title: "Pun", image: nil, tag: 1)

        let dadJokeVC = JokeViewController(category: .dad)
        dadJokeVC.tabBarItem = UITabBarItem(title: "Dad", image: nil, tag: 2)

        viewControllers = [goodJokeVC, punJokeVC, dadJokeVC]
    }
}
