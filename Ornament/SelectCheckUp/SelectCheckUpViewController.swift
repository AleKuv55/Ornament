//
//  SelectCheckUpViewController.swift
//  Ornament
//
//  Created by Anastasia on 20.12.2021.
//

import UIKit

class SelectCheckUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBSegueAction func embedTime(_ coder: NSCoder) -> CheckUpTimeCollectionViewController? {
        return CheckUpTimeCollectionViewController(coder: coder, checkUpTime: ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00","18:00", "19:00", "20:00"])
    }
    
    let time: CheckUpDataModel
    
    init?(coder: NSCoder, time: CheckUpDataModel) {
        self.time = time
        super.init(coder: coder)
    }
    
    @IBOutlet weak var collectionView2: UIView!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
