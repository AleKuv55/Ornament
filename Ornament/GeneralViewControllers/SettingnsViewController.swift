//
//  SettingnsViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 07.12.2021.
//

import UIKit

class SettingnsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        }
   
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.image = UIImage.init(named: "profileImage")
        self.title = "Профиль"

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
