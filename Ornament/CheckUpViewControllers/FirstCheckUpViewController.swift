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
//                let icon1 = UITabBarItem(title: "Title", image: UIImage(named: "Settings"), tag: 0)
//                let icon1 = UIImage.add
    }
    override func viewWillAppear(_ animated: Bool) {
//        tabBarItem.image = UIImage.init(named: "chatImage")

    }
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        tabBarItem.image = UIImage.init(named: "chatImage")
//
//    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        tabBarItem.image = UIImage.init(named: "checkUPImage")
        self.title = "Чекапы"
//        fatalError("init(coder:) has not been implemented")
    }
    init() {
        super.init(nibName: nil, bundle: nil)
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
