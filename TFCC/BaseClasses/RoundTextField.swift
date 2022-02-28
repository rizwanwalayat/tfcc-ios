//
//  RoundTextField.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 25/02/2022.
//

import UIKit

@IBDesignable
class RoundTextField: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    let padding = UIEdgeInsets(top: 12, left: 15, bottom: 12, right: 15);



    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    //    @IBInspectable var cornerRadius: CGFloat = 19 {
    //        didSet {
    //            updateCornerRadius()
    //        }
    //    }
    //
    //    @IBInspectable var borderWidth: CGFloat = 1{
    //           didSet{
    //               self.layer.borderWidth = borderWidth
    //           }
    //       }
    //
    //    @IBInspectable var borderColor: UIColor = UIColor.borderGrey{
    //           didSet{
    //               self.layer.borderColor = borderColor.cgColor
    //           }
    //       }

//
//    func updateCornerRadius(){
//        self.layer.cornerRadius = cornerRadius
//    }
}
