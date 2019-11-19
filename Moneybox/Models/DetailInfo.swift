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
        
        static func urlRequestDetailInfo(){
        //MARK: Get

            let url2 = URL(string: Constants.url)!

        var request2 = URLRequest(url: url2)

        // setting the HTTP headers
        request2.httpMethod = "GET"
            request2.setValue(Constants.appId, forHTTPHeaderField: "AppId")
            request2.setValue(Constants.contentType, forHTTPHeaderField: "Content-Type")
            request2.setValue(Constants.appVersion, forHTTPHeaderField:"appVersion")
            request2.setValue(Constants.apiVersion, forHTTPHeaderField:"apiVersion")
    //    request2.setValue("Bearer " + bearerToken, forHTTPHeaderField: "Authorization")

            



        // URL session request
        let detailTask = URLSession.shared.dataTask(with: request2) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
        //        if let data = data, let dataString = String(data: data, encoding: .utf8) {
        //            print("data: \(dataString)")
                    
                    let jsonDecoder = JSONDecoder()

                              if let data = data,
                                 let dataString = try?
                                     jsonDecoder.decode(DetailInfo.self, from: data) {
                                print(dataString.TotalPlanValue)
                                print(dataString.ProductResponses[1].Id)
                                print(dataString.ProductResponses[1].Moneybox)
                                print(dataString.ProductResponses[1].PlanValue)
                                print(dataString.ProductResponses[1].Product.FriendlyName)


               }
            }
        }
        detailTask.resume()
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
