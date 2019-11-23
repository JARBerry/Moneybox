//
//  ViewController.swift
//  Moneybox
//
//  Created by James Berry on 18/11/2019.
//  Copyright © 2019 JARBerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    
    @IBOutlet weak var loginOutletButton: UIButton!
    
    
    @IBOutlet weak var emailLabel: UITextField!
    
    @IBOutlet weak var passwordLabel: UITextField!
    
    
    @IBOutlet weak var nameLabel: UITextField!
    
    var name = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginOutletButton.setTitle("Login", for: .normal)
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        
    loginOutletButton.setTitle("Accessing Info", for: .normal)
        
//        HeaderInfo.urlRequestHeader {(token) in
//        print("Front Screen URL \(token)")
//        }
        
       
        HeaderInfo.urlRequestHeader {(token, name) in
           
                        print("Header URL Request \(token)")
                        print("Header URL Request Name is ... \(name)")
                       
                   self.name = name
        }
        
        
        print("Here is the name : \(name)")
        
        
        
        
        
        
        
// Moves from ViewController to UserAccountsViewController and presents it modally
       
//        let vc = self.storyboard?.instantiateViewController(identifier: "dataForwards") as! UserAccountsViewController
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
//        
      
        
    }
    
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
      
                     if segue.identifier == "dataUser" {
        
                         // Passing the info over to the Payment Viewcontroller
                         let uavc = segue.destination as! UserAccountsViewController

                           uavc.uavcname = name
                    
                     }
   
}
}
