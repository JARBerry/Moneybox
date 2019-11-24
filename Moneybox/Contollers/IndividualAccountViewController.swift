//
//  IndividualAccountViewController.swift
//  Moneybox
//
//  Created by James Berry on 18/11/2019.
//  Copyright © 2019 JARBerry. All rights reserved.
//

import UIKit

class IndividualAccountViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var planValueLabel: UILabel!
    @IBOutlet weak var moneyboxLabel: UILabel!
    @IBOutlet weak var successOrFailLabel: UILabel!
    
    // Variable declaration
    var status = 0
    var moneybox = 0.0
    
    var iavcId = 0
    var iavcAccountName = ""
    var iavcPlanValue = 0.0
    var iavcMoneybox = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Displays account name, plan value and moneybox on IndividualAccountViewController
        accountLabel.text = iavcAccountName
        planValueLabel.text = "£" + String(iavcPlanValue)
        moneyboxLabel.text = "£" + String(iavcMoneybox)
        
    }
    
    
    
    
    
    
    //IBACTION if add £10 - call payment info with correct id
    
    @IBAction func addTenPoundsButton(_ sender: UIButton) {
        
        // Retrives HeaderInfo incase bearer token expires.
        HeaderInfo.urlRequestHeader {(token, name) in
            
            PaymentInfo.urlRequestPaymentInfo(token: token, accountid: self.iavcId){(status, moneybox) in
                
                
                self.status = status
                self.moneybox = moneybox
            }
            
            
            
        }
        
        
        DispatchQueue.main.async {
            
            
            self.moneyboxLabel.text = "£" + String(self.moneybox)
        }
        
        // Incomplete ran out of time and this tells you if payment is successful or unsuccssful
        if status == 0 {
            successOrFailLabel.text = "Payment Successful"
        } else  {
            successOrFailLabel.text = "Payment Unsuccessful"
        }
        
        
        
    }
    
}
