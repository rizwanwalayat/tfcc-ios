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
    
    //MARK: - Variables
    let data = [["text": "Psychological", "image": "psychological-"],
                ["text": "Marriage", "image": "marriage-"],
                ["text": "Family", "image": "family-"],
                ["text": "Family", "image": "educational-"],
                ["text": "Pre-Marital", "image": "pre-marital-"],
                ["text": "Addiction", "image": "addiction-"],
                ["text": "Aging", "image": "aging-"],
                ["text": "Family Violence", "image": "family-violence-"],
                ["text": "Family Reconcile", "image": "family-reconcile-"],
                ["text": "Center News", "image": "center-news-"],
                ["text": "Workshops & Seminars", "image": "workshps-seminars-"]]
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Helper Methods
    func config(indexPath: IndexPath) {
        if indexPath.item < data.count {
            self.categoryImageView.image = UIImage(named: data[indexPath.item]["image"] ?? "")
            self.categoryLabel.text = data[indexPath.item]["text"]
        }
    }
}
