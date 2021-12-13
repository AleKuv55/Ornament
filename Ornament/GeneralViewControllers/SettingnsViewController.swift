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
        view.backgroundColor = UIColor.green
        title = "item1"
        print("item 1 loaded")
        tabBarItem.image = .remove
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
