//
//  FAQsTableCell.swift
//  TFCC
//
//  Created by Asad Mehmood on 04/03/2022.
//

import UIKit

class FAQsTableCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var containerViewTopConstraint: NSLayoutConstraint!
    
    //MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Helper Methods
    func config(indexPath: IndexPath) {
        if indexPath.row == 0 {
            containerViewTopConstraint.constant = 30
        }
        else {
            containerViewTopConstraint.constant = 20
        }
    }
}
