//
//  PhysicianListingViewModel.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 04/03/2022.
//

import Foundation

//typealias DispatchesListCompletionHandler = (_ data: DispatchesListModel?, _ error: Error?, _ status: Bool?, _ message: String) -> Void

class PhysicianListingViewModel: NSObject {
//    var data: DispatchesListModel?
    
    override init(){
        super.init()
    }

//    func fetchData(_ completionhandler: @escaping DispatchesListCompletionHandler) {
//        Utility.showLoading()
//        APIClient.shared.ListApiFunctionCall { result, error, status, message in
//            Utility.hideLoading()
//
//            let newResult = ["result": result]
//
//            if status, error == nil, let data = Mapper<ListModel>().map(JSON: newResult as [String: Any]) {
//                self.data = data
//                completionhandler(data, error, status, message)
//            } else {
//                completionhandler(nil, error, status, message)
//            }
//
//        }
//    }
}
