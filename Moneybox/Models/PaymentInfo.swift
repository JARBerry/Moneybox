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
    
    // This is the POST reuest for PaymentInfo
    static func urlRequestPaymentInfo(token: String, accountid: Int, completion: @escaping (Int, Double) -> ()) {
        
        let url = URL(string: "https://api-test01.moneyboxapp.com/oneoffpayments")!
        
        var request = URLRequest(url: url)
        
        // setting the HTTP headers
        request.httpMethod = "POST"
        
        request.setValue(Constants.appId, forHTTPHeaderField: Constants.urlAppId)
        
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("5.10.0", forHTTPHeaderField:"appVersion")
        request.setValue("3.0.0", forHTTPHeaderField:"apiVersion")
        request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        
        
        // setting the HTTP body with email and password and Idfa
        let newTodo: [String: Any] = [Constants.urlEmail: Constants.email, Constants.urlPassword: Constants.password, Constants.urlIdfa: Constants.idfa, Constants.urlAmount: Constants.amount, Constants.urlInvestorProductId: accountid]
        
        
        
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
                
                let jsonDecoder = JSONDecoder()
                
                if let data = data,
                    let dataString = try?
                        jsonDecoder.decode(PaymentInfo.self, from: data) {
              // harding status  - ran out of time
                    completion(200,dataString.Moneybox)
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
