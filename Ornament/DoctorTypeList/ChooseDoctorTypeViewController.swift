//
//  ChooseDoctorTypeViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 21.11.2021.
//

import UIKit

class ChooseDoctorTypeViewController: UIViewController {

    let list: [String] = ["Терапевт","Хирург","Лор","Офтальмолог", "Диетолог", "Психолог"]

    let PersonDoctor1: PersonDoctorDataModel = PersonDoctorDataModel(name: "Андрей Болконcкий", imagePath: "Bolkonskiy", rating: "1", isBusy: false)
    let PersonDoctor2: PersonDoctorDataModel = PersonDoctorDataModel(name: "Оксимирон", imagePath: "Image", rating: "2", isBusy: true)
    let PersonDoctor3: PersonDoctorDataModel = PersonDoctorDataModel(name: "Дмитрий Путьков", imagePath: "Dima", rating: "5", isBusy: false)
    let PersonDoctor4: PersonDoctorDataModel = PersonDoctorDataModel(name: "Орландо Блум", imagePath: "Orlando", rating: "4", isBusy: false)
    let PersonDoctor5: PersonDoctorDataModel = PersonDoctorDataModel(name: "Андрей Болконcкий", imagePath: "Image", rating: "3", isBusy: false)
    
    var doctorNameList: [[PersonDoctorDataModel]] = []
//        [[PersonDoctor1, PersonDoctor2], [PersonDoctor3], [PersonDoctor4]]
    
    private let doctorTypeTableView = DoctorTypeView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        let icon1 = UITabBarItem(title: "Title", image: UIImage(named: "Settings"), tag: 0)
//        UIImage.add
//        tabBarItem = icon1
        tabBarItem.image = UIImage.add
        tabBarItem.selectedImage = UIImage.add
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = doctorTypeTableView
    }
    override func viewDidLoad() {
        super.viewDidLoad ()
        self.title = "Выберите врача"

//        doctorNameList.append()
        doctorNameList.append(contentsOf: [[PersonDoctor1, PersonDoctor2], [PersonDoctor3], [PersonDoctor4], [PersonDoctor5], [PersonDoctor1],[PersonDoctor2]])
        
        doctorTypeTableView.backgroundColor = .white
        doctorTypeTableView.tableView.sectionHeaderHeight = UITableView.automaticDimension
        doctorTypeTableView.tableView.rowHeight = UITableView.automaticDimension
        doctorTypeTableView.tableView.register(DoctorTypeTableViewCell.self, forCellReuseIdentifier:"reuseIdentifier")
        doctorTypeTableView.tableView.delegate = self
        doctorTypeTableView.tableView.dataSource = self
        doctorTypeTableView.tableView.allowsSelection = true
    }
    private var sectionNumber: Int = 3
    let cellSpacingHeight: CGFloat = 5

}

// MARK: - UITableViewDataSource
extension ChooseDoctorTypeViewController: UITableViewDataSource {
  
    func numberOfSections (in tableView: UITableView) -> Int {
        list.count
    }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }

    
//  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//    let headerView = CustomHeaderUIView()
//    headerView.update(
//       dataModel: CustomHeaderViewModel(title: "mega title", subtitle: "section \(section)"))
//    return headerView
//  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! DoctorTypeTableViewCell
    cell.update(type: list[indexPath.section])
    cell.layer.borderColor = UIColor.black.cgColor
    cell.layer.borderWidth = 1
    cell.layer.cornerRadius = 8
//    cell.selectionStyle = .gray


//    cell.clipsToBounds = true

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! DoctorTypeTableViewCell
    tableView.cellForRow(at: indexPath)?.backgroundView?.backgroundColor = .gray
//    print(indexPath)
//    cell.backgroundColor = UIColor.red

//    tableView.deselectRow(at: indexPath, animated: false)
    let viewController = PersonDoctorUIViewController(doctorList: doctorNameList[indexPath.section])
    self.navigationController?.pushViewController(viewController, animated: true)

    
    // передать InitViewController эту логику???? тогда нужно, чтобы здесь активировалось событие
    
    
//    sectionNumber += 1
//    customView.tableView.deleteRows(at: indexPath], with: .automatic)
  }
  }

// MARK: - UITableviewDelegate
extension ChooseDoctorTypeViewController: UITableViewDelegate {
     
}
