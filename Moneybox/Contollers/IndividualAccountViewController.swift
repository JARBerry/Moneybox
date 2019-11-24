//
//  IndividualAccountViewController.swift
//  Moneybox
//
//  Created by James Berry on 18/11/2019.
//  Copyright © 2019 JARBerry. All rights reserved.
//

import UIKit

class IndividualAccountViewController: UIViewController {
    
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var planValueLabel: UILabel!
    
    @IBOutlet weak var moneyboxLabel: UILabel!
    
    @IBOutlet weak var successOrFailLabel: UILabel!
    
    var status = 0
    
    var iavcId = 0
    var iavcAccountName = ""
    var iavcPlanValue = 0.0
    var iavcMoneybox = 0.0
    
    var moneybox = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        accountLabel.text = iavcAccountName
        planValueLabel.text = "£" + String(iavcPlanValue)
        moneyboxLabel.text = "£" + String(iavcMoneybox)
      
       
        
      
        // get the id pass through
        // change display for correct account
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {

        
      
    }
    
    

    //IBACTION if add £10 - call payment info with correct id
    
    @IBAction func addTenPoundsButton(_ sender: UIButton) {
        
        print("Account id : \(iavcId)")
        HeaderInfo.urlRequestHeader {(token, name) in
            print("Payment Header URL Request \(token)")
            print("Payment Header URL Request Name \(name)")
            
           
            PaymentInfo.urlRequestPaymentInfo(token: token, accountid: self.iavcId){(status, moneybox) in
             //   DispatchQueue.main.async{
                print(moneybox)
                print(status)
                self.status = status
                self.moneybox = moneybox
                print("money money money \(moneybox)")
            }
          //  }
         
            
        }
        
        
        print("status \(status)")
        
    
        
           DispatchQueue.main.async {
                   
               
                   self.moneyboxLabel.text = "£" + String(self.moneybox)
               }
        
        // Need to fix
                               if status == 0 {
                                                  successOrFailLabel.text = "Payment Successful"
                                              } else  {
                                                  successOrFailLabel.text = "Payment Unsuccessful"
                                              }
       
        
     
    }
    
   
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
