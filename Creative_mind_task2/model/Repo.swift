//
//  Repo.swift
//  Creative_mind_task2
//
//  Created by ahmedxiio on 6/26/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import SwiftyJSON

class Repo:NSObject, NSCoding {
    //Mark : Properities
    
    var id:Int?
    var owner: String?
    var name: String?
    var desc:String?
    var fork:Bool?
    var html:String?
    
    init(with json: JSON) {
        
        self.id = json["id"].int
        
        self.owner = json["owner"]["login"].string
        self.name = json["name"].string

        self.desc = json["description"].string
        
        self.fork = json["fork"].bool
        
        self.html = json["html_url"].string
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.owner = aDecoder.decodeObject(forKey: "owner") as? String
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.desc = aDecoder.decodeObject(forKey: "desc") as? String
        self.html = aDecoder.decodeObject(forKey: "html") as? String
        self.fork = aDecoder.decodeObject(forKey: "fork") as? Bool


    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(owner, forKey: "owner")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(desc, forKey: "desc")
        aCoder.encode(html, forKey: "html")
        aCoder.encode(fork, forKey: "fork")


    }
    
}
