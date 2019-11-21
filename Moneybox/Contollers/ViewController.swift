//
//  ViewController.swift
//  Moneybox
//
//  Created by James Berry on 18/11/2019.
//  Copyright © 2019 JARBerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailLabel: UITextField!
    
    @IBOutlet weak var passwordLabel: UITextField!
    
    
    @IBOutlet weak var nameLabel: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
         HeaderInfo.urlRequestHeader()
        
        // get token
        
        // perform segue and pass token
        
    }
    
   
   
}

