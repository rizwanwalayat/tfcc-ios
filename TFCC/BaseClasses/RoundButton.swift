//
//  RoundButton.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 25/02/2022.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }
    
    @IBInspectable var cornerRadius: CGFloat = 22 {
        didSet {
            updateCornerRadius()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
           didSet{
               self.layer.borderWidth = borderWidth
           }
       }

       @IBInspectable var borderColor: UIColor = UIColor.clear{
           didSet{
               self.layer.borderColor = borderColor.cgColor
           }
       }
    

    func updateCornerRadius(){
        self.layer.cornerRadius = cornerRadius
    }
    
}
