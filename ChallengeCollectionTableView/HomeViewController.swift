//
//  ViewController.swift
//  ChallengeCollectionTableView
//
//  Created by Vinicius on 08/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataColors: Colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureTableView()
    }
    
    private func configureNavigation() {
        navigationItem.title = "ChallengeCollectionTableView"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.tableViewCellIdentifier)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        199
    }
    
}

extension HomeViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataColors.objectsArray[section].category
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataColors.objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataColors.objectsArray[section].subcategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.tableViewCellIdentifier, for: indexPath) as? CategoryTableViewCell else{ return UITableViewCell() }
        
        
        cell.setupTableViewCell(subCategoryTitle: dataColors.objectsArray[indexPath.section].subcategory[indexPath.row], listColors: dataColors.objectsArray[indexPath.section].colors[indexPath.row])
        return cell
    }
}
