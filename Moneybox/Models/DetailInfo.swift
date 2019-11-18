//
//  DetailInfo.swift
//  Moneybox
//
//  Created by James Berry on 18/11/2019.
//  Copyright © 2019 JARBerry. All rights reserved.
//

import Foundation

// This is the structure called DetailInfo for TotalPlanValue and ProductResponses the names have to match the datas names.
struct DetailInfo: Codable {
    let TotalPlanValue: Double
    let ProductResponses: [ProductDetail]
   

}

// This is the structure called ProductDetail for Id, PlanValue, Moneybox and Product the names have to match the datas names so you can access them.
    struct ProductDetail: Codable {
        let Id: Int
        let PlanValue: Double
        let Moneybox: Int
        let Product: ProductInfo
        
        // This is the structure called ProductInfo for FriendlyName the names have to match the datas names so you can access them..
        struct ProductInfo: Codable {
            let FriendlyName : String
        }
    }
// This is the DetailInfoCodingKeys so the below datas names will now use camel case
enum DetailInfoCodingKeys: String, CodingKey {
      case totalPlanValue = "TotalPlanValue"
     case productResponses = "ProductResponses"
     case id = "Id"
     case planValue = "PlanValue"
    case moneybox = "Moneybox"
    case product = "Product"
    case friendlyName = "FriendlyName"
   }
