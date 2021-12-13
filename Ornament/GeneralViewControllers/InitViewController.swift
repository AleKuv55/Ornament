//
//  ViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 09.12.2021.
//

import UIKit

class InitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Добро пожаловать"
//        navigationItem.largeTitleDisplayMode = .never
        

    }
    

    @IBAction func didTab(_ sender: Any) {

        let tabBarController = TabBarController()
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
}
