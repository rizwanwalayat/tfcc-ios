//
//  ResetPasswordVM.swift
//  CarrierApp
//
//  Created by Phaedra Solutions  on 06/08/2021.
//  Copyright © 2021 codesrbit. All rights reserved.
//
import ObjectMapper
import Foundation

typealias SignUpCompletionHandler = (_ result: SignUpDataModel?, _ error: Error?, _ status: Bool?, _ message: String?) -> ()


class SignUpVM: NSObject {
    
    var data = [String:String]()
    static let shared = SignUpVM()
    
//    init(responseData : SignUpDataModel) {
//        data = responseData
//    }
    
    func signUp1Values(){
        
    }
    
    func createAccount(email: String, password: String, wasteIDs: String, capacity: String, _ completion: @escaping SignUpCompletionHandler) {
        Utility.showLoading()
        
        APIClient.shared.createAccount(email: email, password: password, wasteIDs: wasteIDs, capacity: capacity) { result, error, status, message in
            Utility.hideLoading()
            
            if status , error == nil {
                
                let newResult = ["result" : result]
                if let data = Mapper<SignUpDataModel>().map(JSON: newResult as [String : Any]) {
                    completion(data, nil, status, message)
                }
                else {
                    completion(nil, nil, false, message)
                }

            } else {
                completion(nil, error, status, message)
            }
        }
    }
}
