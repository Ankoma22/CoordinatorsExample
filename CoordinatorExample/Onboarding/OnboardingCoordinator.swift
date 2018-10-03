//
//  OnboardingCoordinator.swift
//  CoordinatorExample
//
//  Created by Andrei Malyhin on 10/3/18.
//  Copyright © 2018 FLO HEALTH, Inc. All rights reserved.
//

import UIKit
import RxSwift

final class OnboardingCoordinator: AnyCoordinator {
    private let window: UIWindow?
    private let disposeBag = DisposeBag()
    
    init(with window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        let viewModel = OnboardingViewModel()
        viewModel.output.userLoggedIn.subscribe(onNext: { [unowned self] in
            
        })
        let onboardingViewController = OnboardingViewController(viewModel: viewModel)
        window?.rootViewController = onboardingViewController
        window?.makeKeyAndVisible()
    }
}
