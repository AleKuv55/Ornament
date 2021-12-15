//
//  SettingnsViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 07.12.2021.
//

import UIKit

struct ProfileDataModel {
    let name: String
    let surname: String
    let profilePhoto: String
}

struct SettingsDataModel {
    let setting: String}

class SettingnsViewController: UIViewController {

    private let settingsMenuView = SettingsMenuView()

    override func loadView() {
        self.view = settingsMenuView
        view.backgroundColor = .systemBackground
        }

    let profileInfo: [ProfileDataModel] = [ProfileDataModel(name: "Дмитрий", surname: "Путьков", profilePhoto: "Dima")]

    let settingsInfo: [SettingsDataModel] = [SettingsDataModel(setting: "Позвонить нам"),
                                             SettingsDataModel(setting: "О проекте"),
                                             SettingsDataModel(setting: "Условия")]

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.image = UIImage.init(named: "profileImage")
        self.title = "Профиль"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsMenuView.tableView1.tableFooterView = UIView()
        settingsMenuView.tableView1.rowHeight = UITableView.automaticDimension
        settingsMenuView.tableView1.sectionHeaderHeight = UITableView.automaticDimension
        settingsMenuView.tableView1.register(ProfileViewCell.self, forCellReuseIdentifier:"reuseIdentifier")
        settingsMenuView.tableView1.delegate = self
        settingsMenuView.tableView1.dataSource = self

        settingsMenuView.tableView2.tableFooterView = UIView()
        settingsMenuView.tableView2.rowHeight = UITableView.automaticDimension
        settingsMenuView.tableView2.sectionHeaderHeight = UITableView.automaticDimension
        settingsMenuView.tableView2.register(SettingsViewCell.self, forCellReuseIdentifier:"reuseIdentifier")
        settingsMenuView.tableView2.delegate = self
        settingsMenuView.tableView2.dataSource = self
    }
}

extension SettingnsViewController: UITableViewDataSource {
    func numberOfSections (in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //// не уверена, что стоит это оставлять
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
//        let cell1 = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ProfileViewCell
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! SettingsViewCell
//        cell1.updateCellData(dataModel: profileInfo[indexPath.section])
        cell2.updateCellData(dataModel: settingsInfo[indexPath.section])
        return cell2
    }
}

extension SettingnsViewController: UITableViewDelegate {
    
}
