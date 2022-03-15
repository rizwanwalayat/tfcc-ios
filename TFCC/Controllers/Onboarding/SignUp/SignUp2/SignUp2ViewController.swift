//
//  WelcomeViewController.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import UIKit
import iOSDropDown

class SignUp2ViewController: BaseViewController {

    var selectedEconomic: String?
    var economicList = ["Rich", "Poor", "Middle"]
    var toolBar:UIToolbar = UIToolbar()
    var viewModel: SignUpVM?
    
    @IBOutlet weak var economicConditionDD: DropDown!
    @IBOutlet weak var socialStateDD: DropDown!
    @IBOutlet weak var countryDD: DropDown!
    @IBOutlet weak var cityDD: DropDown!
    @IBOutlet weak var SignUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDropDowns()

    }
    
    func setupDropDowns(){
        economicConditionDD.setLeftPaddingPoints(15)
        economicConditionDD.optionArray = ["Wealthy", "Average", "Needy"]
     
        socialStateDD.setLeftPaddingPoints(15)
        socialStateDD.optionArray = ["Single", "Married", "Divorced"]
        
        countryDD.setLeftPaddingPoints(15)
        countryDD.optionArray = ["Saudi Arabia", "Kuwait", "Jordan"]

        cityDD.setLeftPaddingPoints(15)
        cityDD.optionArray = ["Riyadh", "Jeddah", "Medina", "Mecca"]
        
    }
    
    @IBAction func signInBtnAction(_ sender: Any) {
        coordinator?.signInScreen()
    }
    
    @IBAction func SignUpBtnAction(_ sender: Any) {
        coordinator?.signUp3TOSScreen()
    }
    
}

