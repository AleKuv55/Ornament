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
        view.backgroundColor = UIColor.green
        self.title = "item1"
        print("item 1 loaded")
        tabBarItem.image = .remove
        }
}
