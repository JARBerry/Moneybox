//
//  HeaderInfo.swift
//  Moneybox
//
//  Created by James Berry on 18/11/2019.
//  Copyright © 2019 JARBerry. All rights reserved.
//

import Foundation

// This is the structure called HeaderInfo for UserId,FirstName and LastName the names have to match the datas names so you access them.
struct HeaderInfo: Codable {
    let User: UserInfo
    struct UserInfo: Codable {
        let UserId: String
        let FirstName: String
        let LastName: String
    }
    let Session: SessionInfo
    // This the structure called SessionInfo this contains the BearToken.
    struct SessionInfo: Codable {
        let BearerToken : String
    }
}
   
// This is the CodingKeys so the below datas names will now use camel case
   enum CodingKeys: String, CodingKey {
       case userId = "UserId"
      case firstName = "FirstName"
      case lastName = "LastName"
      case bearerToken = "BearerToken"
    }
