//
//  FrendsListController+Delegate.swift
//  VKclient
//
//  Created by Aleksandr  on 14.03.2023.
//

import UIKit

extension FrendsListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForCellTableView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(friends[indexPath.row])
    }
}
