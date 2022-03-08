//
//  TimeCollectionViewCell.swift
//  EasyGift
//
//  Created by HaiDer's Macbook Pro on 01/11/2021.
//  Copyright © 2021 codesrbit. All rights reserved.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var startingTime: UILabel!
    @IBOutlet weak var endingTime: UILabel!
    @IBOutlet weak var spacer: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

//    func config(timeSelectionIndex: Int, indexPath: IndexPath, data : [ProductTime]) {
//        if data.count > 0 && data.count >= indexPath.row {
//            self.startingTime.text = Utility.getAMPMFormattedTimeFrom24HourFormat(time: data[indexPath.row].startTime ?? "") ?? ""
//            self.endingTime.text = Utility.getAMPMFormattedTimeFrom24HourFormat(time: data[indexPath.row].endTime ?? "") ?? ""
//            if timeSelectionIndex == indexPath.row {
//                mainView.backgroundColor = UIColor(hexString: "000000", alpha: 0.10)
//                spacer.textColor = UIColor(hexString: "000000", alpha: 0.30)
//                startingTime.textColor = UIColor(hexString: "000000", alpha: 0.30)
//                endingTime.textColor = UIColor(hexString: "000000", alpha: 0.30)
//            }
//            else {
//                mainView.backgroundColor = UIColor(hexString: "FFFFFF", alpha: 1)
//                spacer.textColor = UIColor.secondary
//                startingTime.textColor = UIColor.secondary
//                endingTime.textColor = UIColor.secondary
//            }
////            hideSkeletonAnimation()
//        }
//        else {
////            self.showAnimatedGradientSkeleton()
//        }
//    }
    
//    func hideSkeletonAnimation() {
//        self.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
//    }
}
