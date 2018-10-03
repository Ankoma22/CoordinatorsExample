//
//  AppCoordinator.swift
//  CoordinatorExample
//
//  Created by Andrei Malyhin on 10/3/18.
//  Copyright © 2018 FLO HEALTH, Inc. All rights reserved.
//

import UIKit

let kUserLoggedIn = "kUserLoggedIn"

final class AppCoordinator: AnyCoordinator {
    private let window: UIWindow?
    
    init(with window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        if UserDefaults.standard.bool(forKey: kUserLoggedIn) {
            let mainCoordinator = MainCoordinator(with: window)
            coordinate(to: mainCoordinator)
        } else {
            let onboardingCoordinator = OnboardingCoordinator(with: window)
            coordinate(to: onboardingCoordinator)
        }
    }
}
