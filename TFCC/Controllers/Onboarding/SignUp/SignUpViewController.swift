//
//  WelcomeViewController.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import UIKit
import iOSDropDown

class SignUpViewController: BaseViewController {

    @IBOutlet weak var genderDropDown: DropDown!
    @IBOutlet weak var emailTF: RoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDropDowns()
        // Do any additional setup after loading the view.
    }

    func setupDropDowns(){
        genderDropDown.optionArray = ["Male", "Female"]
        genderDropDown.optionIds = [1, 2]
        genderDropDown.didSelect{(selectedText , index ,id) in
        print("Selected String: \(selectedText) \n index: \(index) \n id: \(id)")
        }
    }
    @IBAction func nextBtnAction(_ sender: Any) {
        coordinator?.signUp2Screen()
    }
    
    @IBAction func signInBtnAction(_ sender: Any) {
        coordinator?.signInScreen()
    }
    
    
}

