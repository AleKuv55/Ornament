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
        self.view = personDoctorTableView
        
    }
    private let doctors : [String]

    init(doctorList: [String]) {
        
        self.doctors = doctorList
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Просмотрите врачей"

        personDoctorTableView.tableView.sectionHeaderHeight = UITableView.automaticDimension
        personDoctorTableView.tableView.register(PersonDoctorTableViewCell.self, forCellReuseIdentifier:"newIdentifier")
        personDoctorTableView.tableView.delegate = self
        personDoctorTableView.tableView.dataSource = self

    }
}
extension PersonDoctorUIViewController: UITableViewDataSource {
  
    func numberOfSections (in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "newIdentifier", for: indexPath) as! PersonDoctorTableViewCell
//    cell.update(data: CellDataModel (title: "title for path \(indexPath)", isCompleted: false))
    return cell
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
  }

// MARK: - UITableviewDelegate
extension PersonDoctorUIViewController: UITableViewDelegate {
     
}
