//
//  ChooseDoctorTypeViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 21.11.2021.
//

import UIKit

class ChooseDoctorTypeViewController: UIViewController {

    let list: Array<String> = ["Терапевт","Хирург","Лор"]

    private let doctorTypeTableView = DoctorTypeView()
    
    override func loadView() {
        self.view = doctorTypeTableView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad ()
        self.title = "Выберите врача"

        doctorTypeTableView.tableView.sectionHeaderHeight = UITableView.automaticDimension
        doctorTypeTableView.tableView.rowHeight = UITableView.automaticDimension
        doctorTypeTableView.tableView.register(DoctorTypeTableViewCell.self, forCellReuseIdentifier:"reuseIdentifier")
        doctorTypeTableView.tableView.delegate = self
        doctorTypeTableView.tableView.dataSource = self
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
//    cell.clipsToBounds = true

    return cell
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let viewController = PersonDoctorUIViewController()
    self.navigationController?.pushViewController(viewController, animated: true)

    // передать InitViewController эту логику???? тогда нужно, чтобы здесь активировалось событие
    
    
//    sectionNumber += 1
//    customView.tableView.deleteRows(at: indexPath], with: .automatic)
  }
  }

// MARK: - UITableviewDelegate
extension ChooseDoctorTypeViewController: UITableViewDelegate {
     
}
