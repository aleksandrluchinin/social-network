//
//  AllGroupsController.swift
//  VKclient
//
//  Created by Aleksandr  on 15.03.2023.
//

import UIKit

class AllGroupsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let reuseindetifierUniversalTableViewCell = "reuseindetifierUniversalTableViewCell"
    //let allGroups = ["Skazka", "Music", "Kino", "Lesson"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseindetifierUniversalTableViewCell)
    }
}

extension AllGroupsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.share.allGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseindetifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else { return UITableViewCell() }
        
        cell.configure(image: nil, name: Storage.share.allGroups[indexPath.row], descripshion: nil)
        return cell
    }
}

extension AllGroupsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForCellTableView
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(Storage.share.allGroups[indexPath.row])
            NotificationCenter.default.post(name: groupAllGroupNotification, object: Storage.share.allGroups[indexPath.row])
        }
    }

