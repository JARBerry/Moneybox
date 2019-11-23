//
//  UserAccountsViewController.swift
//  Moneybox
//
//  Created by James Berry on 18/11/2019.
//  Copyright © 2019 JARBerry. All rights reserved.
//

import UIKit

class UserAccountsViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var planValueLabel: UILabel!
    
    var uavcToken = ""
    
    var uavcname = ""
    
    var name = ""
    
    var giMoneybox = 0.0
    var giAccountName = ""
    var giId = 0
    var giPlanValue = 0.0
    
    var sasMoneybox = 0.0
    var sasAccountName = ""
    var sasId = 0
    var sasPlanValue = 0.0
    
    var lisaMoneybox = 0.0
    var lisaAccountName = ""
    var lisaId = 0
    var lisaPlanValue = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
     
   
     //   nameLabel.text = name
           planValueLabel.text = "7890"
   
         print("this should be after data received")
    }
     
    override func viewWillAppear(_ animated: Bool) {
     
   
      
        HeaderInfo.urlRequestHeader {(token, name) in
                
            //     print("Header URL Request \(token)")
            //
            //     print("Header URL Request Name \(name)")
                
            self.name = name
            print(name)
                 
                 DetailInfo.urlRequestDetailInfo(token: (token)){(sasPlanValue, sasAccountName, sasId, sasMoneybox, lisaPlanValue, lisaAccountName, lisaId, lisaMoneybox, giPlanValue, giAccountName, giId, giMoneybox) in
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
                     
                 }
                
                 }
           print("hello \(name)")
         
            
            DispatchQueue.main.async{
                self.nameLabel.text = name
               }
        }
        
        super.viewWillAppear(animated)

    }
    
    
    
    
    //  IBAction if stocks and shares - pass through id for stocks
    
    @IBAction func stocksAndSharesButton(_ sender: UIButton) {
        
       
        
    
    }
    
    
        //  IBAction if GIA - pass through id for GIA
    
    @IBAction func genralInvestmentsButton(_ sender: UIButton) {
         
                     }
    
           //  IBAction if ISA - pass through id for ISA
    @IBAction func lifetimeISAButton(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
      
                     if segue.identifier == "dataGi" {
        
                         // Passing the info over to the Payment Viewcontroller
                         let iavc = segue.destination as! IndividualAccountViewController

                        iavc.iavcId = giId
                        iavc.iavcMoneybox = giMoneybox
                        iavc.iavcPlanValue = giPlanValue
                        iavc.iavcAccountName = giAccountName
                    
                     }

        if segue.identifier == "dataSas" {
             
                              // Passing the info over to the Payment Viewcontroller
                              let iavc = segue.destination as! IndividualAccountViewController

                             iavc.iavcId = sasId
                             iavc.iavcMoneybox = sasMoneybox
                             iavc.iavcPlanValue = sasPlanValue
                             iavc.iavcAccountName = sasAccountName
                         
                          }
        
        if segue.identifier == "dataLisa" {
             
                              // Passing the info over to the Payment Viewcontroller
                              let iavc = segue.destination as! IndividualAccountViewController

                             iavc.iavcId = lisaId
                             iavc.iavcMoneybox = lisaMoneybox
                             iavc.iavcPlanValue = lisaPlanValue
                             iavc.iavcAccountName = lisaAccountName
                         
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

