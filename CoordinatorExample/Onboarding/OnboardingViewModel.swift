//
//  OnboardingViewModel.swift
//  CoordinatorExample
//
//  Created by Andrei Malyhin on 10/3/18.
//  Copyright © 2018 FLO HEALTH, Inc. All rights reserved.
//

import Foundation
import RxSwift

final class OnboardingViewModel: ViewModel {
    struct Input {
        let userLoggedIn: AnyObserver<Void>
    }
    
    struct Output {
        let userLoggedIn: Observable<Void>
    }
    
    let input: Input
    let output: Output
    
    private let loginSubject = PublishSubject<Void>()
    
    init() {
        self.input = Input(userLoggedIn: loginSubject.asObserver())
        self.output = Output(userLoggedIn: loginSubject.asObservable())
    }
}
