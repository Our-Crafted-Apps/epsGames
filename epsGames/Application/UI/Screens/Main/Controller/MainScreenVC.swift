//
//  MainScreenVC.swift
//  epsGames
//
//  Created by Кирилл Пучков on 29.07.2020.
//  Copyright © 2020 Sergey Mikhailov. All rights reserved.
//

import UIKit

final class MainScreenVC<View: MainScreenView>: BaseViewController<View> {
    
    var onCheck: BoolClosure?
    
//    private let loginStatusProvider: LoginStatusProvider
//
//    init(loginStatusProvider: LoginStatusProvider) {
//        self.loginStatusProvider = loginStatusProvider
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        title = "EPS Games"
    }
    

}

