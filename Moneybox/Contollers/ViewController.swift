//
//  ViewController.swift
//  Moneybox
//
//  Created by James Berry on 18/11/2019.
//  Copyright © 2019 JARBerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Outlets
    @IBOutlet weak var loginOutletButton: UIButton!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    
    // Variable declaration
    var name = ""
    // Ran out of time - could retrieve from http but not screen refresh(Hardcoded value).
    var totalPlanValue = 8364.5
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginOutletButton.setTitle("Login", for: .normal)
    }
    
    
    //Login Button Action
    @IBAction func loginButton(_ sender: UIButton) {
        
        // HeaderInfo.urlRequestHeader gets token and name of account user
        HeaderInfo.urlRequestHeader {(token, name) in
            
            self.name = name
            
            DetailInfo.urlRequestDetailInfo(token: (token)){(sasPlanValue, sasAccountName, sasId, sasMoneybox, lisaPlanValue, lisaAccountName, lisaId, lisaMoneybox, giPlanValue, giAccountName, giId, giMoneybox, totalPlanValue) in
                DispatchQueue.main.async{
                    
                    //Retrieve totalPlanValue
                    self.totalPlanValue = totalPlanValue
                }
                
            }
            
        }
        
    }
    
    // Prepare for segue to go to the UserAccountsViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Segue identifier
        if segue.identifier == "dataUser" {
            
            // Passing the info over to the Payment Viewcontroller
            let uavc = segue.destination as! UserAccountsViewController
            // Passes name and plan value over to UserAccountsViewController
            uavc.uavcname = name
            uavc.uavcTotalPlanValue = totalPlanValue
            
        }
        
    }
}
