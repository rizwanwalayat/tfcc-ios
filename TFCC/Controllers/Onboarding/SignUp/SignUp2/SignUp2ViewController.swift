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
    var economicConditionSelected = false
    var socialStateSelected = false
    var countrySelected = false
    var citySelected = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDropDowns()

    }
    
    func setupDropDowns(){
        economicConditionDD.setLeftPaddingPoints(15)
        economicConditionDD.optionArray = ["Wealthy", "Average", "Needy"]
        economicConditionDD.didSelect{(selectedText , index ,id) in
            self.economicConditionSelected = true
        }
     
        socialStateDD.setLeftPaddingPoints(15)
        socialStateDD.optionArray = ["Single", "Married", "Divorced"]
        socialStateDD.didSelect{(selectedText , index ,id) in
            self.socialStateSelected = true
        }
        
        countryDD.setLeftPaddingPoints(15)
        countryDD.optionArray = ["Saudi Arabia", "Kuwait", "Jordan"]
        countryDD.didSelect{(selectedText , index ,id) in
            self.countrySelected = true
        }

        cityDD.setLeftPaddingPoints(15)
        cityDD.optionArray = ["Riyadh", "Jeddah", "Medina", "Mecca"]
        cityDD.didSelect{(selectedText , index ,id) in
            self.citySelected = true
        }
        
    }
    
    
    @IBAction func signInBtnAction(_ sender: Any) {
                coordinator?.signInScreen()
    }
    
    @IBAction func SignUpBtnAction(_ sender: Any) {
        if economicConditionSelected && socialStateSelected && countrySelected && citySelected {
            viewModel?.saveSignUp2Values(economicCondition: economicConditionDD.text!, socialState: socialStateDD.text!, country: countryDD.text!, city: cityDD.text!)
            coordinator?.signUp3TOSScreen()

        } else {
            showToast(message: "Please select all Fields")
        }
        
    }
    
}

