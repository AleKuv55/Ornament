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
//        let icon1 = UITabBarItem(title: "Title", image: imageSetting, tag: 0)
//        item1.tabBarItem = icon1
        let item3 = customViewController
        let item4 = SettingnsViewController()

       

        //        let icon1 = UITabBarItem(title: "Title", image: UIImage(named: "Image"), selectedImage: UIImage(named: "Image"))
//        item1.tabBarItem = icon1
//        let item2 = ChooseDoctorTypeViewController()
//        let icon2 = UITabBarItem(title: "Title", image: UIImage(named: "Dima.png"), selectedImage: UIImage(named: "otherImage.png"))
//        item2.tabBarItem = icon2
        let controllers = [item1, item2, item3, item4]
        self.viewControllers = controllers
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
