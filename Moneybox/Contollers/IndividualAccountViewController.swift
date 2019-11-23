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
    
    
    var iavcId = 0
    var iavcAccountName = ""
    var iavcPlanValue = 0.0
    var iavcMoneybox = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        accountLabel.text = iavcAccountName
        planValueLabel.text = "£" + String(iavcPlanValue)
        moneyboxLabel.text = "£" + String(iavcMoneybox)
        
      
        // get the id pass through
        // change display for correct account
        
        // Do any additional setup after loading the view.
    }
    

    //IBACTION if add £10 - call payment info with correct id
    
    @IBAction func addTenPoundsButton(_ sender: UIButton) {
        
        
        HeaderInfo.urlRequestHeader {(token, name) in
            print("Payment Header URL Request \(token)")
            print("Payment Header URL Request Name \(name)")
            
            //
            //            DetailInfo.urlRequestDetailInfo((token)){(Id) in
            PaymentInfo.urlRequestPaymentInfo(token: token)
           
                
                
                
            
        
            
        }
        
    }
    
    
    
    //if status vcode is 200 diaply info.
    
    //if not get bearertoken and retry.
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
