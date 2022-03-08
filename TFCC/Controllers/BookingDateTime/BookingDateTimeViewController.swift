//
//  SelectDateViewController.swift
//  EasyGift
//
//  Created by HaiDer's Macbook Pro on 01/11/2021.
//  Copyright © 2021 codesrbit. All rights reserved.
//

import UIKit
//import SkeletonView

protocol SelectDateAndTime {
    func Status(date:String,time:String)
}

class BookingDateTimeViewController: UIViewController {
    
    //MARK:- IBActions
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var dateCollectionView: UICollectionView!
    @IBOutlet weak var timeCollectionView: UICollectionView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var timeContainerView: UIView!
    @IBOutlet weak var confirmButton: UIButton!
    
    //MARK:- Variables
//    var delegate : SelectDateAndTime?
//    var startTimeId = ""
//    var endTime = ""
//    var month = ""
//    var day = ""
//    var date = ""
//    var dateSelectionIndex = -1
//    var timeSelectionIndex = -1 {
//        didSet {
//            if timeSelectionIndex == -1 {
//                UIView.animate(withDuration: 0.3) {
//                    self.confirmButton.alpha = 0
//                }
//            }
//        }
//    }
//    var vendorId : String?
//    var timeOfProduct : [ProductTime] = []
//    var startingDate = Date() {
//        didSet {
//            self.dateCollectionView.reloadData()
//        }
//    }
//    var selectedDate = ""
    var coordinator: MainCoordinator?
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        timeCollectionView.register(UINib(nibName: "TimeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "timeCollectionViewCell")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        UIView.animate(withDuration: 0.1) {
            self.containerView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)
//        }
    }
    //MARK:- IBActions
    @IBAction func confirmAction(_ sender: Any) {
//        hidePopup()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25 ) {
//            self.delegate?.Status(date: self.selectedDate, time: self.startTimeId)
//        }
    }
    @IBAction func chooseDateAction(_ sender: Any) {
//        let vc = CalenderPopUpViewController(nibName: "CalenderPopUpViewController", bundle: nil)
//        vc.delegate = self
//        vc.modalPresentationStyle = .overFullScreen
//        self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func hideAction(_ sender: Any) {
//        hidePopup()
    }
    
    //MARK:- Private Methods
    private func hidePopup()
    {
        popUpView.alpha = 1
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
            
            self.popUpView.alpha = 0
            self.popUpView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            
        }) { (success) in
            
            self.dismiss(animated: false, completion: nil)
            
        }
    }
    
}

//extension SelectDateViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
////    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
////        "timeCollectionViewCell"
////    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == dateCollectionView {
//            return 3
//        }
//        else {
//            return self.timeOfProduct.count == 0 ? 3 : self.timeOfProduct.count
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == dateCollectionView{
//            let cell = collectionView.register(DateCollectionViewCell.self, indexPath: indexPath)
//            cell.config(selectionIndex: dateSelectionIndex, indexPath: indexPath, date: Utility.getNextDate(byAddingDays: indexPath.row, to: startingDate))
//            return cell
//        }
//        else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeCollectionViewCell", for: indexPath) as! TimeCollectionViewCell
//
//            cell.config(timeSelectionIndex: timeSelectionIndex, indexPath: indexPath, data: self.timeOfProduct)
//            return cell
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: ScreenSize.SCREEN_WIDTH/3-20, height: collectionView.frame.height)
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionView == dateCollectionView {
//            let selectedDate = Utility.getNextDate(byAddingDays: indexPath.row, to: startingDate)
//            self.dateSelectionIndex = indexPath.row
//            self.timeSelectionIndex = -1
//            self.timeCollectionView.reloadSections(NSIndexSet(index: 0) as IndexSet)
//            self.selectedDate = Utility.getFormattedDateStringForFormat(format: "YYYY-MM-dd", date: selectedDate)
//            self.dateCollectionView.reloadData()
//            fetchTimeList()
//        }
//        else {
//            if timeOfProduct.count > 0 && timeOfProduct.count >= indexPath.row {
//                self.timeSelectionIndex = indexPath.row
//                self.startTimeId = self.timeOfProduct[indexPath.row].id ?? ""
//                self.timeCollectionView.reloadSections(NSIndexSet(index: 0) as IndexSet)
//                UIView.animate(withDuration: 0.3) {
//                    self.confirmButton.alpha = 1
//                }
//            }
//        }
//    }
//}

//MARK: - GetCalenderDetailsPopUp
//extension SelectDateViewController: GetCalenderDetailsPopUp {
//    func date(date: Date) {
//        self.startingDate = date
//
//        self.dateSelectionIndex = -1
//        if timeContainerView.isHidden == false {
//            UIView.animate(withDuration: 0.15) {
//                self.timeContainerView.isHidden = true
//            }
//        }
//        self.dateCollectionView.reloadData()
//    }
//}

//MARK: - APICall
//extension SelectDateViewController {
//    func fetchTimeList() {
//        Utility.showLoading()
//        ProductTime.getTimeList(date: self.selectedDate, idOfVendor: self.vendorId ?? "") { products, error, status, message in
//            if let _ = products {
//                self.timeOfProduct = products!
//                UIView.animate(withDuration: 0.15) {
//                    Utility.hideLoading()
//                    self.timeContainerView.isHidden = false
//                    self.timeCollectionView.reloadData()
//                }
//            }
//            else {
//                UIView.animate(withDuration: 0.15) {
//                    Utility.hideLoading()
//                    self.timeContainerView.isHidden = true
//                }
//                self.showAlert(title: "text_error".localized, message: message ?? "unknown_error".localized)
//                self.dateSelectionIndex = -1
//                self.dateCollectionView.reloadData()
//            }
//        }
//    }
//}
