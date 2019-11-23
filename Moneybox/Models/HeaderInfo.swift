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
    
   
    
    static func urlRequestHeader(_ completion: @escaping (String,String) -> ())  {

        
        let url = URL(string: Constants.url)!

                 
            var request = URLRequest(url: url)
                  
                  // setting the HTTP headers
                  request.httpMethod = "POST"
        request.setValue(Constants.appId, forHTTPHeaderField: Constants.urlAppId)
        request.setValue(Constants.contentType, forHTTPHeaderField: Constants.urlContentType)
        request.setValue(Constants.appVersion, forHTTPHeaderField:Constants.urlAppVersion)
        request.setValue(Constants.apiVersion, forHTTPHeaderField:Constants.urlApiVersion)
                 
        let newTodo: [String: Any] = [Constants.urlEmail: Constants.email, Constants.urlPassword: Constants.password, Constants.urlIdfa: Constants.idfa]
                 let jsonTodo: Data
                 do {
                     jsonTodo = try JSONSerialization.data(withJSONObject: newTodo, options: [])
                     request.httpBody = jsonTodo
                 } catch {
                     print("Error: cannot create JSON from todo")

                 }
                 
                 //URL session request
                 let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                     if let error = error {
                         print("error: \(error)")
                     } else {
                         if let response = response as? HTTPURLResponse {
                             print("statusCode: \(response.statusCode)")
                         }
                      //  if let data = data, let dataString = String(data: data, encoding: .utf8) {
                             let jsonDecoder = JSONDecoder()

                                   if let data = data,
                                      let dataString = try?
                                          jsonDecoder.decode(HeaderInfo.self, from: data) {
                                   
                                 
                                  ///   print("Header token \(dataString.Session.BearerToken)")
//
//                                    let token =
//                                        dataString.Session.BearerToken + dataString.User.FirstName
                                    
                                    let token = dataString.Session.BearerToken
                                    let name = dataString.User.FirstName
                                    print("Header Bearer Token \(token)")
                                      completion(token, name)
                               //      extractDetailInfo(bearerToken: token)
                        
                         }
                     
                     }
                 }
                 task.resume()

            

                 
             }



   





}
   
// This is the CodingKeys so the below datas names will now use camel case
   enum CodingKeys: String, CodingKey {
       case userId = "UserId"
      case firstName = "FirstName"
      case lastName = "LastName"
      case bearerToken = "BearerToken"
    }
