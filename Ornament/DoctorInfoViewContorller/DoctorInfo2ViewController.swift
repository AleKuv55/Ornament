//
//  DoctorInfo2ViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 13.12.2021.
//

import UIKit

class DoctorInfo2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.doctorName.text = doctor.name
        self.doctorImage.image = UIImage.init(named: doctor.imagePath)

        self.doctorStatus.text = doctor.isBusy ? "Занят" : "Свободен"
        self.doctorScore.text = doctor.rating
//        self.doctorType.text = doctor.
    }
    @IBOutlet weak var doctorYearsWork: UILabel!
    

    @IBOutlet weak var doctorStatus: UILabel!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorScore: UILabel!
    
    @IBOutlet weak var doctorTypeLabel: UILabel!
    @IBOutlet weak var doctorImage: UIImageView!
    
    @IBSegueAction func emdedInfo(_ coder: NSCoder) -> DoctorTimeCollectionViewController? {
        return DoctorTimeCollectionViewController(coder: coder, doctorTime: ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00","18:00", "19:00", "20:00"])
    }
    let doctor:PersonDoctorDataModel
    
    init?(coder: NSCoder, doctor: PersonDoctorDataModel) {
        self.doctor = doctor
        super.init(coder: coder)
        }
    
    @IBOutlet weak var collectionView: UIView!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
