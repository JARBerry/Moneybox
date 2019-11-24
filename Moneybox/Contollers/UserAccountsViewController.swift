//
//  UserAccountsViewController.swift
//  Moneybox
//
//  Created by James Berry on 18/11/2019.
//  Copyright © 2019 JARBerry. All rights reserved.
//

import UIKit

class UserAccountsViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var planValueLabel: UILabel!
    
    // Variables declaration for data passed from login Screen
    var uavcToken = ""
    var uavcname = ""
    var uavcTotalPlanValue = 8364.5 //Hardcode due to refresh  - ran out time
    // Variables for GI Account
    var giMoneybox = 0.0
    var giAccountName = ""
    var giId = 0
    var giPlanValue = 0.0
    // Variables for Sas Account
    var sasMoneybox = 0.0
    var sasAccountName = ""
    var sasId = 0
    // Variables for Lisa Account
    var sasPlanValue = 0.0
    var lisaMoneybox = 0.0
    var lisaAccountName = ""
    var lisaId = 0
    var lisaPlanValue = 0.0
    //Local variables for screen
    var totalPlanValue = 0.0
    var name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        // Incase bearer token expires refresh header and detail url requests.
        HeaderInfo.urlRequestHeader {(token, name) in
            
            
            
            self.name = name
            
            
            DetailInfo.urlRequestDetailInfo(token: (token)){(sasPlanValue, sasAccountName, sasId, sasMoneybox, lisaPlanValue, lisaAccountName, lisaId, lisaMoneybox, giPlanValue, giAccountName, giId, giMoneybox, totalPlanValue) in
                DispatchQueue.main.async{
                    self.giMoneybox = giMoneybox
                    self.giId = giId
                    self.giAccountName = giAccountName
                    self.giPlanValue = giPlanValue
                    
                    self.sasId = sasId
                    self.sasMoneybox = sasMoneybox
                    self.sasPlanValue = sasPlanValue
                    self.sasAccountName = sasAccountName
                    
                    self.lisaId = lisaId
                    self.lisaMoneybox = lisaMoneybox
                    self.lisaPlanValue = lisaPlanValue
                    self.lisaAccountName = lisaAccountName
                    self.totalPlanValue = totalPlanValue
                }
                
            }
            
            // Displays text for name and plan value
            DispatchQueue.main.async{
                self.nameLabel.text = name
                self.planValueLabel.text = "£" + String(self.uavcTotalPlanValue)
            }
        }
        
        super.viewWillAppear(animated)
        
    }
    
    
    
    
    //  IBAction stocks and shares is connected on with the storyboard so you click the button and go the individualAccountViewController
    
    @IBAction func stocksAndSharesButton(_ sender: UIButton) {
        
        
        
        
    }
    
    
    //  IBAction if GIA - pass through id for GIA is connected on with the storyboard so you click the button and go the individualAccountViewController
    
    @IBAction func genralInvestmentsButton(_ sender: UIButton) {
        
    }
    
    //  IBAction if ISA - pass through id for ISA is connected on with the storyboard so you click the button and go the individualAccountViewController
    @IBAction func lifetimeISAButton(_ sender: UIButton) {
    }
    
    // This displays the users accounts and passes the right account to the IndividualViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // If segue identifier is equal to dataGI it displays the account on the IndivialAccountViewController
        if segue.identifier == "dataGi" {
            
            // Passing the info over to the IndivialAccountViewController
            let iavc = segue.destination as! IndividualAccountViewController
            
            // Passes over id, moneybox, plan value, and account name to IndivialAccountViewController
            iavc.iavcId = giId
            iavc.iavcMoneybox = giMoneybox
            iavc.iavcPlanValue = giPlanValue
            iavc.iavcAccountName = giAccountName
            
        }
        
        // If segue identifier is equal to dataSas it displays the account on the IndivialAccountViewController
        if segue.identifier == "dataSas" {
            
            // Passing the info over to the Payment Viewcontroller
            let iavc = segue.destination as! IndividualAccountViewController
            
            //Passes over id, moneybox, plan value, and account name to IndivialAccountViewController
            iavc.iavcId = sasId
            iavc.iavcMoneybox = sasMoneybox
            iavc.iavcPlanValue = sasPlanValue
            iavc.iavcAccountName = sasAccountName
            
        }
        
        // If segue identifier is equal to dataLisa it displays the account on the IndivialAccountViewController
        if segue.identifier == "dataLisa" {
            
            // Passing the info over to the Payment Viewcontroller
            let iavc = segue.destination as! IndividualAccountViewController
            //Passes over id, moneybox, plan value, and account name to IndivialAccountViewController
            iavc.iavcId = lisaId
            iavc.iavcMoneybox = lisaMoneybox
            iavc.iavcPlanValue = lisaPlanValue
            iavc.iavcAccountName = lisaAccountName
            
        }
        
        
    }
    
}

