//
//  DoctorInfoViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 09.12.2021.
//

import UIKit

struct MenuNameDataModel {
    let name: String
    let subName: String
    let menuImage: String
}

class MainMenuViewController: UIViewController {

    private let mainMenuView = MainMenuView()
    
    override func loadView() {
        self.view = mainMenuView
        view.backgroundColor = .white
    }

    let menuInfo: [MenuNameDataModel] = [MenuNameDataModel(name: "Поговорите с врачом", subName: "Консультация с различными специалистами", menuImage: "chatImage@3x"), MenuNameDataModel(name: "Анализ здоровья", subName: "Выберите необходимый чекап", menuImage:"checkUPImage@3x"), MenuNameDataModel(name: "Ваш профиль", subName: "Информация и конфиденциальность", menuImage:"profileImage@3x")]
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.image = UIImage.init(named: "homeImage")
        self.title = "Главное меню"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "Просмотрите врачей"
        mainMenuView.tableView.tableFooterView = UIView()
        mainMenuView.tableView.rowHeight = UITableView.automaticDimension
        mainMenuView.tableView.sectionHeaderHeight = UITableView.automaticDimension
        mainMenuView.tableView.register(MainMenuTableViewCell.self, forCellReuseIdentifier:"reuseIdentifier")
        mainMenuView.tableView.delegate = self
        mainMenuView.tableView.dataSource = self
    }
}
extension MainMenuViewController: UITableViewDataSource {
  
    func numberOfSections (in tableView: UITableView) -> Int {
        3
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! MainMenuTableViewCell
    cell.updateCellData(dataModel: menuInfo[indexPath.section])
    return cell
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
//    TabBarController.
    var viewController = UIViewController()
    switch indexPath.section {
    case 0:
        viewController = ChooseDoctorTypeViewController()
        break;
    case 1:
        viewController = storyboard.instantiateViewController(withIdentifier: "FirstCheckUp") as! FirstCheckUpViewController
        break;
    case 2:
        viewController = SettingnsViewController()
        break;
    default:
        break;
    }
    self.navigationController?.pushViewController(viewController, animated: true)

//    storyboard.instantiateViewController(identifier: <#T##String#>, creator: T##((NSCoder) -> ViewController?)?##((NSCoder) -> ViewController?)?##(NSCoder) -> ViewController?)

  }
  }

// MARK: - UITableviewDelegate
extension MainMenuViewController: UITableViewDelegate {
     
}
