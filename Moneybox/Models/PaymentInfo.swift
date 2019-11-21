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
 
   
    


static func urlRequestPaymentInfo() {
    let url = URL(string: Constants.url)!

    var request = URLRequest(url: url)

    // setting the HTTP headers
    request.httpMethod = "POST"
    request.setValue(Constants.appId, forHTTPHeaderField: Constants.urlAppId)
    request.setValue(Constants.contentType, forHTTPHeaderField: Constants.urlContentType)
    request.setValue(Constants.appVersion, forHTTPHeaderField:Constants.appVersion)
    request.setValue(Constants.apiVersion, forHTTPHeaderField:Constants.urlApiVersion)
    request.setValue("Bearer ZYZxMw5NNw0ZCqa0tuzkaICGT7sAVoQEGMe9Pt8AA8U=", forHTTPHeaderField: "Authorization")



    // setting the HTTP body with email and password and Idfa
    let newTodo: [String: Any] = [Constants.urlEmail: Constants.email, Constants.urlPassword: Constants.password, Constants.urlIdfa: Constants.idfa, Constants.urlAmount: Constants.amount, Constants.urlInvestorProductId: Constants.inverstorProductId]
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
