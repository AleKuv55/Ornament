//
//  FirstCheckUpViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 09.12.2021.
//

import UIKit

class FirstCheckUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // если добавлять свою, то делать так
        //        let icon1 = UITabBarItem(title: "Title", image: UIImage(named: "Settings"), tag: 0)
        //        UIImage.add
        //        tabBarItem = icon1
        tabBarItem.image = UIImage.checkmark
        tabBarItem.selectedImage = UIImage.strokedCheckmark
    }
    override func viewWillAppear(_ animated: Bool) {
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
