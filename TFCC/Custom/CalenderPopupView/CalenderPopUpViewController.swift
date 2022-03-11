//
//  CalenderPopUpViewController.swift
//  EasyGift
//
//  Created by HaiDer's Macbook Pro on 26/10/2021.
//  Copyright © 2021 codesrbit. All rights reserved.
//

import UIKit
import FSCalendar

protocol GetCalenderDetailsPopUp {
    
    func date(date:Date)
    
}


class CalenderPopUpViewController: UIViewController {
    let yearsArray = ["2022", "2023", "2024", "2025", "2026", "2027", "2028"]

    @IBOutlet weak var popUpView: UIView!
    var delegate : GetCalenderDetailsPopUp?
    var selectedDate = Date()
    @IBOutlet weak var calenderView: FSCalendar!
    @IBOutlet weak var selectedDateFromCalender: UILabel!
    @IBOutlet weak var rightButton: UIButton!{
        didSet{
//            if AppSettings.appLanguage == AppLanguage.arabic.rawValue {
                rightButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//            }
        }
    }
    @IBOutlet weak var leftButton: UIButton!{
        didSet{
//            if AppSettings.appLanguage == AppLanguage.arabic.rawValue {
                leftButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//            }
        }
    }
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var yearsContentView: UIView!
    @IBOutlet weak var yearLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calenderView.placeholderType = .none
        self.popUpView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        calenderView.calendarHeaderView.backgroundColor =  UIColor.themeColor
        
        updateDateLabel(Date())
        rightButton.setTitle("", for: .normal)
        leftButton.setTitle("", for: .normal)
        dropDownButton.setTitle("", for: .normal)
//        calenderView.locale = Locale(identifier: AppSettings.appLanguage)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [],  animations: {
            
          self.popUpView.transform = .identity
        })
    }
    //MARK: - Functions
    
    func hidePopup()
    {
        popUpView.alpha = 1
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
            
            self.popUpView.alpha = 0
            self.popUpView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        }) { (success) in
            
            self.dismiss(animated: false, completion: nil)

        }
    }
    
    fileprivate func updateDateLabel(_ date: Date) {
        
        let matchingDate = DateFormatter()
        matchingDate.dateFormat = "E, MMM dd"
//        matchingDate.locale = Locale(identifier: AppSettings.appLanguage)
        let result = matchingDate.string(from: date)
        self.selectedDateFromCalender.text  = result
        
        
        let dateStringForYears = date.dateToString("MMMM yyyy")
        yearLabel.text = dateStringForYears
    }
    
    @IBAction func hidePopUp(_ sender: Any) {
        hidePopup()
        
    }
    @IBAction func cancelAction(_ sender: Any) {
        hidePopup()
    }
    
    @IBAction func okAction(_ sender: Any) {
        delegate?.date(date: self.selectedDate)
        hidePopup()
    }
    
    @IBAction func previousMonthPressed(_ sender: Any) {
        
        selectedDate = selectedDate.getPreviousMonth() ?? Date()
        calenderView.select(selectedDate, scrollToDate: true)
        self.updateDateLabel(selectedDate)
    }
    
    @IBAction func nextMonthPressed(_ sender: Any) {
        selectedDate = selectedDate.getNextMonth() ?? Date()
        calenderView.select(selectedDate, scrollToDate: true)
        self.updateDateLabel(selectedDate)
    }
    
    @IBAction func dropDownYearsPressed(_ sender: UIButton)
    {
        guard let frame = yearsContentView.globalFrame else {return }
        print("Calculated Frame is : \(frame)\nActual Frame is :\(yearsContentView.frame)")
        let dropdownPopup = DropDownViewController()
        dropdownPopup.tableViewDataSource = yearsArray
        dropdownPopup.contentViewsFrame = frame
        dropdownPopup.delegate = self
        dropdownPopup.modalPresentationStyle = .overFullScreen
        self.present(dropdownPopup, animated: false, completion: nil)
    }
    
}
extension CalenderPopUpViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        self.selectedDate = date
        self.updateDateLabel(selectedDate)
        return true
    }
    
    
}

extension CalenderPopUpViewController:  DropdownDelegate{
    func didSelect(_ selectedYear: String) {
        
        var dateString = selectedDate.dateToString("E, MMM dd")
        dateString = "\(dateString) \(selectedYear)"
        guard let date = dateString.stringToDate("E, MMM dd yyyy") else {return}
        let dateStringForYears = date.dateToString("MMMM yyyy")
        yearLabel.text = dateStringForYears
        selectedDate = date
    }
}
