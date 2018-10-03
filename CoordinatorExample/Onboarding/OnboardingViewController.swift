//
//  OnboardingViewController.swift
//  CoordinatorExample
//
//  Created by Andrei Malyhin on 10/3/18.
//  Copyright © 2018 FLO HEALTH, Inc. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class OnboardingViewController : UIViewController {
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 400, width: 200, height: 60)
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Log in", for: .normal)
        return button
    }()
    
    private let viewModel: OnboardingViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        view.addSubview(loginButton)
        loginButton.rx.tap.bind(to: viewModel.input.userLoggedIn).disposed(by: disposeBag)
    }
}
