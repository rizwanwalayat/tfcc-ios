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
    
    var query = [String:String]()
    static let shared = SignUpVM()
    
//    init(responseData : SignUpDataModel) {
//        data = responseData
//    }
    
    func saveSignUp1Values(email: String, password: String, phoneNumber: String, name: String, gender: String, dob: String){
        query["patient[email]"] = email
        query["patient[full_name]"] = name
        query["patient[password]"] = password
        query["patient[gender]"] = gender
        query["patient[date_of_birth]"] = dob
        query["patient[contact_number]"] = phoneNumber
    }
    
    func saveSignUp2Values(economicCondition: String, socialState: String, country: String, city: String){
        query["patient[economic_condition]"] = economicCondition
        query["patient[social_state]"] = socialState
        query["patient[address_attributes][country]"] = country
        query["patient[address_attributes][city]"] = city
       
    }
    
    func createAccount(_ completion: @escaping SignUpCompletionHandler) {
        Utility.showLoading()
        
        let params = query.mapValues { Utility.formatQuery($0) }
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
