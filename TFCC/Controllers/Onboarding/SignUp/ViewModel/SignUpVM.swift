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
    
    var query = [String:Any]()

    static let shared = SignUpVM()
        
    
    func saveSignUp1Values(email: String, password: String, phoneNumber: String, name: String, gender: String, dob: String){
        
        query["email"] = email
        query["full_name"] = name
        query["password"] = password
        query["gender"] = Utility.formatQuery(gender)
        query["date_of_birth"] = dob
        query["contact_number"] = phoneNumber
    }
    
    func saveSignUp2Values(economicCondition: String, socialState: String, country: String, city: String){
        query["economic_condition"] = Utility.formatQuery(economicCondition)
        query["social_state"] = Utility.formatQuery(socialState)
        query["address_attributes"] = ["country" : Utility.formatQuery(country) , "city" : Utility.formatQuery(city)]
       
    }
    
    func createAccount(_ completion: @escaping SignUpCompletionHandler) {
        Utility.showLoading()
        
        let params:[String:Any] = ["patient": query]
        APIClient.shared.createAccount(params: params) { result, error, status, message in
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
