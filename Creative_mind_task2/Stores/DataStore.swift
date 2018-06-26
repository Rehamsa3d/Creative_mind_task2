//
//  DataStore.swift
//  Creative_mind_task2
//
//  Created by ahmedxiio on 6/26/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
class DataStore{
    private static let UserKey = "user"
    private static func archiveUser(_ user :Repo) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: user as Repo) as NSData
    }
    static func loadUser() -> Repo? {
        if let unarchivedObject = UserDefaults.standard.object(forKey: UserKey) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? Repo
        }
        return nil
    }
    static func saveUser(_ user : Repo?) {
        let archivedObject = archiveUser(user!)
        UserDefaults.standard.set(archivedObject, forKey: UserKey)
        UserDefaults.standard.synchronize()
    }
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: UserKey)
        UserDefaults.standard.synchronize()
    }
}
