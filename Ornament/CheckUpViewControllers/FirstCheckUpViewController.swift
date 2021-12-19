//
//  FirstCheckUpViewController.swift
//  Ornament
//
//  Created by Anastasia on 09.12.2021.
//

import UIKit

class FirstCheckUpViewController: UIViewController {

//    @IBOutlet weak var twoCategory: UIView!
    @IBOutlet weak var allCheckUps: UIView!
    
    @IBSegueAction func embedAllCheckups(_ coder: NSCoder) -> AllCheckUpsViewController? {
        return AllCheckUpsViewController(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        tabBarItem.image = UIImage.init(named: "checkUPImage")
        self.title = "Чекапы"
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

}
