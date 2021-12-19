//
//  TabBarController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 09.12.2021.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let customViewController = storyboard.instantiateViewController(withIdentifier: "FirstCheckUp") as! FirstCheckUpViewController

        let item1 = MainMenuViewController()

        let item2 = ChooseDoctorTypeViewController()

        let item3 = customViewController
        
        let item4 = SettingnsViewController()

        let controllers = [item1, item2, item3, item4]
        self.viewControllers = controllers
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
}
