//
//  API.swift
//  Creative_mind_task2
//
//  Created by ahmedxiio on 6/26/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire

class API{
    
    class func getSquare(page_num:Int,completion: @escaping (_ error :Error? , _ repo :[Repo]? )->Void){
        
        let url = "https://api.github.com/users/square/repos?page=\(page_num)&per_page=10"
        
        Alamofire.request(url, method: .get).responseJSON { response in
            
            switch response.result{
                
            case .failure(let error):
                
                completion(error, nil)
                print(error)
                
            case .success(let value):
                
                let json = JSON(value)
                
                guard let jsonArr = json.array else{
                    
                    completion(nil, nil)
                    
                    return
                }
                
                var repos = [Repo]()
                
                for item in jsonArr {
                    
                    let repo = Repo(with: item)
                    repos.append(repo)
                }
                
                completion(nil, repos)
            }
        }
    }
}
