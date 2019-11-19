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
    let url3 = URL(string: Constants.url)!

    var request3 = URLRequest(url: url3)

    // setting the HTTP headers
    request3.httpMethod = "POST"
    request3.setValue(Constants.appId, forHTTPHeaderField: "AppId")
    request3.setValue(Constants.contentType, forHTTPHeaderField: "Content-Type")
    request3.setValue(Constants.appVersion, forHTTPHeaderField:"appVersion")
    request3.setValue(Constants.apiVersion, forHTTPHeaderField:"apiVersion")
    request3.setValue("Bearer ZYZxMw5NNw0ZCqa0tuzkaICGT7sAVoQEGMe9Pt8AA8U=", forHTTPHeaderField: "Authorization")



    // setting the HTTP body with email and password and Idfa
    let newTodo2: [String: Any] = ["Email": Constants.email, "Password": Constants.password, "Idfa": Constants.idfa, "Amount": Constants.amount, "InvestorProductId": Constants.inverstorProductId]
    let jsonTodo2: Data
    do {
        jsonTodo2 = try JSONSerialization.data(withJSONObject: newTodo2, options: [])
        request3.httpBody = jsonTodo2
    } catch {
        print("Error: cannot create JSON from todo")

    }

    // URL session request
    let paymenttask = URLSession.shared.dataTask(with: request3) { (data, response, error) in
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
