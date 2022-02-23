//
//  DataManager.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import Foundation
import UIKit

class DataManager {
    
    static let shared = DataManager()
    
    

    
    //MARK: - UserState
    
    func setUser(value: Bool) {
        UserDefaults.standard.set(value, forKey: "userState")
    }
    
    func getUser() -> Bool? {
        return UserDefaults.standard.bool(forKey: "userState")
    }
    
    func removeUser() {
        UserDefaults.standard.removeObject(forKey: "userState")
    }
    
    func setNotificationSwitch(value: [Bool]?) {
        UserDefaults.standard.set(value, forKey: "NotificationSwitch")
    }
    
    func getNotificationSwitch() -> [Any]? {
        return UserDefaults.standard.array(forKey: "NotificationSwitch")
    }
    
    
}
