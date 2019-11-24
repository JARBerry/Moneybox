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
 
    static func urlRequestPaymentInfo(token: String, accountid: Int, completion: @escaping (Int, Double) -> ()) {
    //let url = URL(string: Constants.urlIndividualAccount)!
    let url = URL(string: "https://api-test01.moneyboxapp.com/oneoffpayments")!
     print(url)
    var request = URLRequest(url: url)

    // setting the HTTP headers
    request.httpMethod = "POST"
    
    request.setValue(Constants.appId, forHTTPHeaderField: Constants.urlAppId)
//    request.setValue(Constants.contentType, forHTTPHeaderField: Constants.urlContentType)
//    request.setValue(Constants.appVersion, forHTTPHeaderField:Constants.appVersion)
//    request.setValue(Constants.apiVersion, forHTTPHeaderField:Constants.urlApiVersion)
//

       request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("5.10.0", forHTTPHeaderField:"appVersion")
        request.setValue("3.0.0", forHTTPHeaderField:"apiVersion")
        request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")

        
        
   print("payments URL requested \(token)")

    // setting the HTTP body with email and password and Idfa
    let newTodo: [String: Any] = [Constants.urlEmail: Constants.email, Constants.urlPassword: Constants.password, Constants.urlIdfa: Constants.idfa, Constants.urlAmount: Constants.amount, Constants.urlInvestorProductId: accountid]
        
//    let newTodo: [String: Any] = ["Email": "androidtest@moneyboxapp.com", "Password": "P455word12", "Idfa": "ANYTHING", "Amount": 10, "InvestorProductId": 3760]
        
    let jsonTodo: Data
    do {
        jsonTodo = try JSONSerialization.data(withJSONObject: newTodo, options: [])
        request.httpBody = jsonTodo
    } catch {
        print("Error: cannot create JSON from todo")

    }

    // URL session request
    let paymenttask = URLSession.shared.dataTask(with: request) { (data, response, error) in
     
        if let error = error {
            print("error: \(error)")
        } else {
            if let response = response as? HTTPURLResponse {
                print("statusCode: \(response.statusCode)")
            }
           // if let data = data, let dataString = String(data: data, encoding: .utf8) {
                let jsonDecoder = JSONDecoder()

                      if let data = data,
                         let dataString = try?
                             jsonDecoder.decode(PaymentInfo.self, from: data) {
                        completion(200,dataString.Moneybox)
                        
                        print("data: \(dataString)")
                        print(PaymentInfo.self)
            }
        
        }
    }
    paymenttask.resume()

    
}
}
// This is the PaymentInfoCodingKeys so the below datas names will now use camel case
enum PaymentInfoCodingKeys: String, CodingKey {
      case moneybox = "Moneybox"
   
   }
