//
//  DoctorInfoViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 09.12.2021.
//

import UIKit

class DoctorInfoViewController: UIViewController {

    private let doctorInfoView = DoctorInfoView()
//    private let doctorTimeCollectionViewController = DoctorTimeCollectionViewController()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.image = UIImage.add
        tabBarItem.selectedImage = UIImage.add
    }
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        self.title = "Информация о докторе"
        doctorInfoView.backgroundColor = .white
//        doctorInfoView.collectionViewController = doctorTimeCollectionViewController
//
//        self.addChild(doctorTimeCollectionViewController)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = doctorInfoView
        
//        self.view.addSubview(doctorTimeCollectionViewController.view)
////        onscreenConstraints = configureConstraintsForContainedView(containedView: doctorTimeCollectionViewController.view, stage: .onscreen)
////        NSLayoutConstraint.activate(onscreenConstraints)
//        doctorTimeCollectionViewController.didMove(toParent: self)


    }
    
    

}
