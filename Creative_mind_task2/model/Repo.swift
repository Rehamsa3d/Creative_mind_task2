//
//  Repo.swift
//  Creative_mind_task2
//
//  Created by ahmedxiio on 6/26/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import SwiftyJSON

class Repo:NSObject {
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
    
    
}
