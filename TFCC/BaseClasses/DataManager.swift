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
    
    func saveAuthToken(_ token : String) {
        
        UserDefaults.standard.set(token, forKey: "auth_token")
    }
    
//    func getUsersDetail() -> ResultLoginUser? {
//
//        var user: ResultLoginUser?
//
//        if UserDefaults.standard.object(forKey: "user_complete_detail") != nil {
//            user = Mapper<ResultLoginUser>().map(JSONString:UserDefaults.standard.string(forKey: "user_complete_detail")!)
//        }
//        return user
//    }
    
    func getAuthToken() -> String {
        
        if let token = UserDefaults.standard.object(forKey: "auth_token") as? String {
            return token
        }
//        else if let userDetial = self.getUsersDetail() {
//            return userDetial.auth_token
//        }
       
        return ""
    }
    
}
