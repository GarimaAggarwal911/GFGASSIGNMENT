//
//  APICall.swift
//  GeeksForGeeksiOSAssignment
//
//  Created by Vibes Com on 22/07/21.
//  Copyright © 2021 garima. All rights reserved.
//

import Foundation
import Alamofire
import IHProgressHUD

@available(iOS 13.0, *)
class APICall:NSObject{
    func serviceCall(url: String,httpMethod: HTTPMethod, params: [String: String]?, headers: HTTPHeaders? ,completion: @escaping (_ responseData:Result<Data,AFError>)->Void)
       {
           
           IHProgressHUD.show()

           AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON
               {
                   response in
                //   print("response.result \(String(describing: response.result.value))")
         
                   switch response.result {
                                  
                   case .success( _):
                    completion(.success(response.data!))

                                       case .failure(let error):
                                        completion(.failure(error))

                                       default:
                                           fatalError("received non-dictionary JSON response")
                                       }
           
                                 IHProgressHUD.dismiss()
                    
           }
       }

    
}
