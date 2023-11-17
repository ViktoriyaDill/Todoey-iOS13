//
//  NavigationBarController.swift
//  Todoey
//
//  Created by Пользователь on 15.11.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import UIKit

class NavigationBarController: UINavigationController {
    
//    let navigationBar = UINavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.97, green: 0.46, blue: 0.67, alpha: 1.00)
        navigationBar.standardAppearance = appearance;
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 1.00, green: 0.96, blue: 0.96, alpha: 1.00)]
    }
}
