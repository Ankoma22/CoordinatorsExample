//
//  ViewModel.swift
//  CoordinatorExample
//
//  Created by Andrei Malyhin on 10/3/18.
//  Copyright © 2018 FLO HEALTH, Inc. All rights reserved.
//

import Foundation

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}
