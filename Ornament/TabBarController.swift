//
//  TabBarController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 07.12.2021.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let item1 = ChooseDoctorTypeViewController()
//        let icon1 = UITabBarItem(title: "Title", image: imageSetting, tag: 0)
//        item1.tabBarItem = icon1
        let item2 = SettingnsViewController()
//        let icon1 = UITabBarItem(title: "Title", image: UIImage(named: "Image"), selectedImage: UIImage(named: "Image"))
//        item1.tabBarItem = icon1
//        let item2 = ChooseDoctorTypeViewController()
//        let icon2 = UITabBarItem(title: "Title", image: UIImage(named: "Dima.png"), selectedImage: UIImage(named: "otherImage.png"))
//        item2.tabBarItem = icon2
        let controllers = [item1, item2]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
//    let imageSetting: UIImage = resizeImage( image: UIImage(named: "settings")!, targetSize: CGSize(width: 40.0, height: 40.0))

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

   

}
func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}
