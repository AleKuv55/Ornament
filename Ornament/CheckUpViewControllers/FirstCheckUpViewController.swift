//
//  FirstCheckUpViewController.swift
//  Ornament
//
//  Created by Anastasia on 09.12.2021.
//

import UIKit

class FirstCheckUpViewController: UIViewController {

    @IBOutlet weak var allCheckUps: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Чекапы"
        
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
