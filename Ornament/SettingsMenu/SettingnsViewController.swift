//
//  SettingnsViewController.swift
//  Ornament
//
//  Created by Anastasia on 07.12.2021.
//

import UIKit

struct SettingsDataModel {
    let setting: String}

class SettingnsViewController: UIViewController {

    private let settingsMenuView = SettingsMenuView()

    override func loadView() {
        self.view = settingsMenuView
        view.backgroundColor = .white
        }

    private let settingsInfo: [SettingsDataModel] = [SettingsDataModel(setting: "Позвонить нам"),
                                             SettingsDataModel(setting: "О проекте"),
                                             SettingsDataModel(setting: "Условия")]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.image = UIImage.init(named: "profileImage")
        self.title = "Настройки"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsMenuView.tableView.tableFooterView = UIView()
        settingsMenuView.tableView.rowHeight = UITableView.automaticDimension
        settingsMenuView.tableView.sectionHeaderHeight = UITableView.automaticDimension
        settingsMenuView.tableView.register(SettingsViewCell.self, forCellReuseIdentifier:"reuseIdentifier")
        settingsMenuView.tableView.delegate = self
        settingsMenuView.tableView.dataSource = self
    }
}

extension SettingnsViewController: UITableViewDataSource {
    
    func numberOfSections (in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! SettingsViewCell
        cell.updCellData(dataModel: settingsInfo[indexPath.section])
        return cell
    }
}

extension SettingnsViewController: UITableViewDelegate {
    
}
