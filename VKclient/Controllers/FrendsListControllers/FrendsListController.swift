//
//  FrendsListController.swift
//  VKclient
//
//  Created by Aleksandr  on 14.03.2023.
//

import UIKit

class FrendsListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let reuseindetifierUniversalTableViewCell = "reuseindetifierUniversalTableViewCell"
    let friends = ["In", "Yn", "Vin", "Chun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseindetifierUniversalTableViewCell)
    }
}

