//
//  Storage.swift
//  VKclient
//
//  Created by Aleksandr  on 15.03.2023.
//

import UIKit

class Storage: NSObject {
static let share = Storage()
    
    private override init() {
        super.init()
    }
    
    let allGroups = ["Skazka", "Music", "Kino", "Lesson"]
}
