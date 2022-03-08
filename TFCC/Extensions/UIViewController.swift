//
//  UIViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 08/03/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showOkCancelAlertWithOKCompletionHandler(title: String, message: String, okTitle: String, okStyle: UIAlertAction.Style, cancelTitle: String, cancelStyle: UIAlertAction.Style, okCompletion: @escaping (UIAlertAction) -> Void, cancelCompletion: @escaping (UIAlertAction) -> Void){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okTitle, style: okStyle, handler: okCompletion)
        let cancelAction = UIAlertAction(title: cancelTitle, style: cancelStyle, handler: cancelCompletion)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
