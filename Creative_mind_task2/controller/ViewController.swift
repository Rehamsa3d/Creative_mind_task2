//
//  ViewController.swift
//  Creative_mind_task2
//
//  Created by ahmedxiio on 6/26/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Mark:Properities
    
    @IBOutlet weak var tableView: UITableView!
    
    var repos = [Repo]()

    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        handleRefresh()
    }

    private func handleRefresh() {
        API.getSquare() { (error : Error?, repo : [Repo]?) in
            
            if let repos = repo {
                self.repos = repos
                self.tableView.reloadData()
            }
        }
 }
}
//extension for UITableView
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? repoCellTableViewCell {
            
            let repo = repos[indexPath.item]
            
            cell.config(with: repo)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
