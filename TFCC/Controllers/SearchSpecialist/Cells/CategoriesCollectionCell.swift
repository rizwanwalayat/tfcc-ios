//
//  CategoriesCollectionCell.swift
//  TFCC
//
//  Created by Asad Mehmood on 25/02/2022.
//

import UIKit

class CategoriesCollectionCell: UICollectionViewCell {

    //MARK: - IBOutlet
    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
}
