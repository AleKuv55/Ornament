//
//  FirstCheckUpViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 09.12.2021.
//

import UIKit

class FirstCheckUpViewController: UIViewController {

    @IBOutlet weak var twoCategory: UIView!
    @IBOutlet weak var allCheckUps: UIView!
    
//    @IBSegueAction func embedCategories(_ coder: NSCoder) -> TwoCategoryCollectionViewController? {
//        return TwoCategoryCollectionViewController(coder: coder, category: ["🔥Популярные", "🦠Covid-19"])
//    }
    
    @IBSegueAction func embedAllCheckups(_ coder: NSCoder) -> AllCheckUpsViewController? {
        return AllCheckUpsViewController(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // если добавлять свою, то делать так
//                let icon1 = UITabBarItem(title: "Title", image: UIImage(named: "Settings"), tag: 0)
//                let icon1 = UIImage.add
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
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
        navigationController?.navigationBar.prefersLargeTitles = true
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
