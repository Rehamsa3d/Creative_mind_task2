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
        owner.text = data.owner
        name.text = data.name
        des.text = data.desc
        

        if data.fork == true {
                backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }else{
            backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        }
        
    }


}
