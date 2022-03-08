//
//  DateCollectionViewCell.swift
//  EasyGift
//
//  Created by HaiDer's Macbook Pro on 01/11/2021.
//  Copyright © 2021 codesrbit. All rights reserved.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var day: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    func config(selectionIndex: Int, indexPath: IndexPath, date: Date) {
//        month.text = Utility.getFormattedDateStringForFormat(format: "MMM", date: date, locale: AppSettings.appLanguage)
//        self.date.text = Utility.getFormattedDateStringForFormat(format: "dd", date: date)
//        self.day.text = Utility.getFormattedDateStringForFormat(format: "EEEE", date: date, locale: AppSettings.appLanguage)
//        if selectionIndex == indexPath.row {
//            mainView.backgroundColor = UIColor(hexString: "000000", alpha: 0.10)
//            day.textColor = UIColor(hexString: "000000", alpha: 0.30)
//            month.textColor = UIColor(hexString: "000000", alpha: 0.30)
//            self.date.textColor = UIColor(hexString: "000000", alpha: 0.40)
//        }
//        else {
//            mainView.backgroundColor = UIColor(hexString: "FFFFFF", alpha: 1)
//            day.textColor = UIColor.primary
//            month.textColor = UIColor.primary
//            self.date.textColor = UIColor.primary
//        }
//    }
    
}
