//
//  htmlVC.swift
//  Creative_mind_task2
//
//  Created by ahmedxiio on 6/26/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit

class htmlVC: UIViewController,UIWebViewDelegate {

    //Mark:Properities
    @IBOutlet weak var webViewFullScreen: UIWebView!
    var repo: Repo?
 
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        let webUrl : NSURL = NSURL(string: (repo?.html)!)!
        let webRequest : NSURLRequest = NSURLRequest(url: webUrl as URL)
        webViewFullScreen.loadRequest(webRequest as URLRequest)
    }


}
