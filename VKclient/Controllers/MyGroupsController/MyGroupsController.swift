//
//  MyGroupsController.swift
//  VKclient
//
//  Created by Aleksandr  on 15.03.2023.
//

import UIKit

class MyGroupsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let reuseindetifierUniversalTableViewCell = "reuseindetifierUniversalTableViewCell"
    var myGroups = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseindetifierUniversalTableViewCell)
        NotificationCenter.default.addObserver(self, selector: #selector(addGroups(_:)), name: groupAllGroupNotification, object: nil)
    }
    
    func isAlreadyAdd(item: String) -> Bool {
        return myGroups.contains { myGroupsItem in
            myGroupsItem == item
        }
    }
    
    @objc func addGroups(_ notification: Notification) {
        guard let newGroup = notification.object as? String else { return }
        if isAlreadyAdd(item: newGroup) {
            print("\(newGroup) already")
        } else {
            myGroups.append(newGroup)
            print("\(newGroup) was appended")
            //tableView.reloadData()
        }
    }
}

extension MyGroupsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseindetifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else { return UITableViewCell() }
        
        cell.configure(image: nil, name: myGroups[indexPath.row], descripshion: nil)
        return cell
    }
}

extension MyGroupsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForCellTableView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myGroups[indexPath.row])
        myGroups.append(myGroups[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        myGroups.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
}

