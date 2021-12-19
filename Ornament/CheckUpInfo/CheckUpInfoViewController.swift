//
//  CheckUpInfoViewController.swift
//  Ornament
//
//  Created by Anastasia on 19.12.2021.
//

import UIKit

struct CheckUpDataModel {
    let checkUpName: String
    let infoArray: [String]
}

class CheckUpInfoViewController: UIViewController {

    private let checkUpInfoTableView = CheckUpInfoView()
    
    private let checkUp : CheckUpDataModel

    init(checkUp: CheckUpDataModel) {
        
        self.checkUp = checkUp
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = checkUpInfoTableView

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkUpInfoTableView.backgroundColor = .systemBackground
        checkUpInfoTableView.tableView.tableFooterView = UIView()
        
        checkUpInfoTableView.updHeader(updHead: checkUp.checkUpName)
        
        checkUpInfoTableView.tableView.sectionHeaderHeight = UITableView.automaticDimension
        checkUpInfoTableView.tableView.rowHeight = UITableView.automaticDimension
        checkUpInfoTableView.tableView.register(CheckUpInfoCell.self, forCellReuseIdentifier: "reuseIdentifier")
        checkUpInfoTableView.tableView.delegate = self
        checkUpInfoTableView.tableView.dataSource = self
        checkUpInfoTableView.tableView.allowsSelection = true
    }
    
    private var sectionNumber: Int = 3
    let cellSpacingHeight: CGFloat = 5
    
}

// MARK: - UITableViewDataSource
extension CheckUpInfoViewController: UITableViewDataSource {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CheckUpInfoCell
        cell.update(checkUpData: checkUp.infoArray[indexPath.section])
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 0.2
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .systemGray6
        cell.selectionStyle = .none

      cell.clipsToBounds = true

      return cell
    }
}

// MARK: - UITableviewDelegate
extension CheckUpInfoViewController: UITableViewDelegate {
    
}
