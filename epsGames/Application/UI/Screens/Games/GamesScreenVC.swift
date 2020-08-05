//
//  GamesScreenVC.swift
//  epsGames
//
//  Created by Кирилл Пучков on 04.08.2020.
//  Copyright © 2020 Sergey Mikhailov. All rights reserved.
//

import UIKit

final class GamesScreenVC<View: GamesScreenView>: BaseViewController<View> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.title = "Games"
    }

}
