//
//  CheckUpFirstViewController.swift
//  Ornament
//
//  Created by Anastasia on 19.12.2021.
//

import UIKit

class CheckUpFirstViewController: UIViewController {
    
    private let checkUpView = CheckUpView()
    
    override func loadView() {
        self.view = checkUpView
        view.backgroundColor = .systemBackground
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.image = UIImage.init(named: "checkUPImage")
        self.title = "Чекапы"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
