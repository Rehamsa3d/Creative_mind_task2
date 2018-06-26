//
//  repoCellTableViewCell.swift
//  Creative_mind_task2
//
//  Created by ahmedxiio on 6/26/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit

class repoCellTableViewCell: UITableViewCell {

    //Mark:Properities

    @IBOutlet weak var owner: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var des: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //config
    func config(with data:Repo){
        
    }


}
