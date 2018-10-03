//
//  MainCoordinator.swift
//  CoordinatorExample
//
//  Created by Andrei Malyhin on 10/3/18.
//  Copyright © 2018 FLO HEALTH, Inc. All rights reserved.
//

import UIKit

final class MainCoordinator: AnyCoordinator {
    
    private let window: UIWindow?
    
    init(with window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        let mainViewController = MainViewController()
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    }
}
