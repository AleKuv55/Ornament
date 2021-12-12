//
//  PersonTableUIViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 22.11.2021.
//

import UIKit

class PersonDoctorUIViewController: UIViewController {

    private let personDoctorTableView = PersonDoctorUIView()
    
    override func loadView() {
        personDoctorTableView.backgroundColor = .white
        self.view = personDoctorTableView
        
    }
    private let doctors : [PersonDoctorDataModel]

    init(doctorList: [PersonDoctorDataModel]) {
        
        self.doctors = doctorList
//        super.init()
        super.init(nibName: nil, bundle: nil)
    }

//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Просмотрите врачей"
        
        personDoctorTableView.tableView.rowHeight = UITableView.automaticDimension
        personDoctorTableView.tableView.sectionHeaderHeight = UITableView.automaticDimension
        personDoctorTableView.tableView.register(PersonDoctorTableViewCell.self, forCellReuseIdentifier:"reuseIdentifier")
        personDoctorTableView.tableView.delegate = self
        personDoctorTableView.tableView.dataSource = self

    }
}
extension PersonDoctorUIViewController: UITableViewDataSource {
  
    func numberOfSections (in tableView: UITableView) -> Int {
        doctors.count
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
        return 10
    }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! PersonDoctorTableViewCell
//    cell.update(data: doctors[indexPath.section])
    cell.updateCellData(dataModel: doctors[indexPath.section])
    cell.layer.borderColor = UIColor.black.cgColor
    cell.layer.borderWidth = 1
    cell.layer.cornerRadius = 8

    return cell
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let viewController = PersonDoctorUIViewController(doctorList: doctorNameList[indexPath.section])
//    self.navigationController?.pushViewController(viewController, animated: true)
  }
  }

// MARK: - UITableviewDelegate
extension PersonDoctorUIViewController: UITableViewDelegate {
     
}
