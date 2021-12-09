//
//  ViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 14.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonDidTap(_ sender: Any) {
        let tabBarController = TabBarController()
        self.navigationController?.pushViewController(tabBarController, animated: true)

//        let viewController = ChooseDoctorTypeViewController()
//        self.navigationController?.pushViewController(viewController, animated: true)
    }

    @IBOutlet weak var scrollView: UIScrollView!
    
}

