//
//  PhysicianListingTableViewCell.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 04/03/2022.
//

import UIKit

class PatientProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var textStack: UIStackView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var value: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(label:String, value: String){
        self.label.text = label
        self.value.text = value
    }
    
    func configButton(){
        textStack.isHidden = true
        editBtn.isHidden = false
    }
}
