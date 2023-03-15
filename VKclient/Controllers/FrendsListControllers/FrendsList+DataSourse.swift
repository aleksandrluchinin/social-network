//
//  FrendsList+DataSourse.swift
//  VKclient
//
//  Created by Aleksandr  on 14.03.2023.
//

import UIKit

extension FrendsListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseindetifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else { return UITableViewCell() }
        
        cell.configure(image: nil, name: friends[indexPath.row], descripshion: nil)
        return cell
    }
}
