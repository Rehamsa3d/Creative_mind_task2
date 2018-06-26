//
//  ViewController.swift
//  Creative_mind_task2
//
//  Created by ahmedxiio on 6/26/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
//import PagingTableView

class ViewController: UIViewController {
    
    //Mark:Properities
    
    @IBOutlet weak var tableView: UITableView!
    var repos = [Repo]()
    //    let numberOfItemsPerPage = 10
    
    private let refreshControl = UIRefreshControl()
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        setupRefreshControl()
        handleRefresh()
        

    }
    
    //refreshData
    @objc private func refreshData(_ sender: Any) {
        // Fetch Data
        handleRefresh()
    }
    
    //setupTableview
    private func setupTableview() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //setupRefreshControl
    private func setupRefreshControl() {
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
        // Customiz Refresh Control
        refreshControl.tintColor = #colorLiteral(red: 0.3974026913, green: 0.701774423, blue: 0.7133001512, alpha: 1)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching New Repositories ...")

    }
    
    
    //handleRefresh
    private func handleRefresh() {
        
          //pageining
//        for item in 1..<20 {
//            print(item)
//        }
            API.getSquare(page_num: 1) { (error : Error?, repo : [Repo]?,json) in
                
                if let repos = repo {
                    self.repos = repos
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                }
                
                //cachedData
                let cachedData = Repo(with: json!["id"])
                DataStore.saveUser(cachedData)
                
                print(cachedData)
                print(DataStore.saveUser(cachedData))

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
    
    //didSelect
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "html_url", sender: repos[indexPath.item])
        
    }
    
}

// prepare Segue
extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "html_url" {
            if let vc = segue.destination as? htmlVC {
                vc.repo = sender as? Repo
            }
        }
    }
}
