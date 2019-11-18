//
//  ViewController.swift
//  Moneybox
//
//  Created by James Berry on 18/11/2019.
//  Copyright © 2019 JARBerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let url = URL(string: "https://api-test01.moneyboxapp.com/users/login")!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var request = URLRequest(url: url)
        
        // setting the HTTP headers
        request.httpMethod = "POST"
        request.setValue("3a97b932a9d449c981b595", forHTTPHeaderField: "AppId")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("5.10.0", forHTTPHeaderField:"appVersion")
        request.setValue("3.0.0", forHTTPHeaderField:"apiVersion")
    }
   
   

}

