//
//  CodeVerification.swift
//  Waste2x
//
//  Created by HaiDer's Macbook Pro on 09/06/2021.
//  Copyright © 2021 Haider Awan. All rights reserved.
//

import Foundation
import ObjectMapper

typealias SignInUserCompletionHandler = (_ data: SignInUser?, _ error: Error?, _ status: Bool?, _ message:String) -> Void

class SignInUser : Mappable
{
    var success = false
    var message = ""
    var result : ResultSignInUser?

    required init?(map: Map) {
    }

    func mapping(map: Map) {

        success <- map["success"]
        message <- map["message"]
        result <- map["result"]
    }
}

class ResultSignInUser : Mappable {
    var id = -1
    var gender = ""
    var picture_url = ""
    var email = ""
    var full_name = ""
    var contact_number = ""

    var economic_condition = ""
    var social_state = ""
    var address: ResultSignInAddress?


    required init?(map: Map) {
    }

    func mapping(map: Map) {

        id <- map["id"]
        gender <- map["gender"]
        picture_url <- map["picture_url"]
        email <- map["email"]
        full_name <- map["full_name"]
        contact_number <- map["contact_number"]
        economic_condition <- map["economic_condition"]
        social_state <- map["social_state"]
        address <- map["address"]
    }

}


class ResultSignInAddress : Mappable {
    var id = -1
    var city = ""
    var country = ""

    required init?(map: Map) {
    }

    func mapping(map: Map) {

        id <- map["id"]
        city <- map["city"]
        country <- map["country"]
    }
}
