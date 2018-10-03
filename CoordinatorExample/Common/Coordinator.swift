//
//  Coordinator.swift
//  CoordinatorExample
//
//  Created by Andrei Malyhin on 10/3/18.
//  Copyright © 2018 FLO HEALTH, Inc. All rights reserved.
//

import Foundation
import RxSwift

class AnyCoordinator<CoordinatorResult> {
    private let uuid = UUID()
    private var childCoordinators = [UUID : AnyObject]()
    
    private func attachChildCoordinator<T>(_ coordinator: AnyCoordinator<T>) {
        childCoordinators[coordinator.uuid] = coordinator
    }
    
    private func deattachChildCoordinator<T>(_ coordinator: AnyCoordinator<T>) {
        childCoordinators[coordinator.uuid] = coordinator
    }
    
    func start() -> Observable<CoordinatorResult> {
        fatalError("Should be implemented")
    }
    
    func coordinate<T>(to coordinator: AnyCoordinator<T>) -> Observable<T> {
        attachChildCoordinator(coordinator)
        return coordinator.start()
            .do(onNext: { [unowned self] _ in
                self.deattachChildCoordinator(coordinator)
            })
    }
}

extension AnyCoordinator: Hashable {
    var hashValue: Int {
        return uuid.hashValue
    }
    static func == (lhs: AnyCoordinator, rhs: AnyCoordinator) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
