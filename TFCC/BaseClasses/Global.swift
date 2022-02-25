//
//  Global.swift
//  Vocab
//
//  Created by HaiDer's Macbook Pro on 26/12/2021.
//

import Foundation
import UIKit

class Global {
    
    class var shared : Global {
        struct Static {
            static let instance : Global = Global()
        }
        return Static.instance
    }
    
  
    
}
