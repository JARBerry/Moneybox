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
    
    static func urlRequestDetailInfo(token:String, completion: @escaping (Double, String, Int, Double, Double, String, Int, Double, Double, String, Int, Double, Double) -> ()){

            
            //MARK: Get

//            let url = URL(string: Constants.url)!
        let url = URL(string: Constants.urlDetail)!
    
        var request = URLRequest(url: url)

        // setting the HTTP headers
        request.httpMethod = "GET"
            request.setValue(Constants.appId, forHTTPHeaderField: Constants.urlAppId)
            request.setValue(Constants.contentType, forHTTPHeaderField: Constants.urlContentType)
            request.setValue(Constants.appVersion, forHTTPHeaderField:Constants.urlAppVersion)
            request.setValue(Constants.apiVersion, forHTTPHeaderField:Constants.urlApiVersion)
           // request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
            request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")


        

 // print("token is passed through to detail \(token)")

        // URL session request
        let detailTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
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
                              

                    completion(dataString.ProductResponses[0].PlanValue, dataString.ProductResponses[0].Product.FriendlyName, dataString.ProductResponses[0].Id, dataString.ProductResponses[0].Moneybox, dataString.ProductResponses[1].PlanValue, dataString.ProductResponses[1].Product.FriendlyName, dataString.ProductResponses[1].Id, dataString.ProductResponses[1].Moneybox, dataString.ProductResponses[2].PlanValue, dataString.ProductResponses[2].Product.FriendlyName, dataString.ProductResponses[2].Id, dataString.ProductResponses[2].Moneybox,
                               dataString.TotalPlanValue)

               }
                
            }
        }
        detailTask.resume()
        
        }
   
}


// This is the structure called ProductDetail for Id, PlanValue, Moneybox and Product the names have to match the datas names so you can access them.
    struct ProductDetail: Codable {
        let Id: Int
        let PlanValue: Double
        let Moneybox: Double
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
