//
//  PaymentInfo.swift
//  Moneybox
//
//  Created by James Berry on 18/11/2019.
//  Copyright © 2019 JARBerry. All rights reserved.
//

import Foundation

struct PaymentInfo: Codable {

 // These properties have to be the same name as the JSON Data so you can access them
 let Moneybox : Double
 
   
    
}

// This is the PaymentInfoCodingKeys so the below datas names will now use camel case
enum PaymentInfoCodingKeys: String, CodingKey {
      case moneybox = "Moneybox"
   
   }
