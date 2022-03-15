//
//  WelcomeViewController.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import UIKit
import iOSDropDown

class SignUp1ViewController: BaseViewController {
    

    
    @IBOutlet weak var emailTF: RoundTextField!
    @IBOutlet weak var passwordTF: RoundTextField!
    @IBOutlet weak var phoneTF: RoundTextField!
    @IBOutlet weak var nameTF: RoundTextField!
    @IBOutlet weak var genderDropDown: DropDown!
    @IBOutlet weak var dobTF: RoundTextField!
    @IBOutlet weak var nextBtn: UIButton!
    var genderSelected: Bool = false
    var dobSelected: Bool = false
    var btnEnabled: Bool = false
    
    var viewModel: SignUpVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDropDowns()
        // Do any additional setup after loading the view.
    }

    func setupDropDowns(){
        genderDropDown.setLeftPaddingPoints(15)
        genderDropDown.optionArray = ["Male", "Female"]
        genderDropDown.didSelect{(selectedText , index ,id) in
            genderSelected = true
            print("Selected String: \(selectedText) \n index: \(index) \n id: \(id)")
        }
    }
    @IBAction func nextBtnAction(_ sender: Any) {
        if btnEnabled {
            viewModel?.saveSignUp1Values(email: emailTF.text!, password: passwordTF.text!, phoneNumber: phoneTF.text!, name: nameTF.text!, gender: genderDropDown.text!, dob: dobTF.text!)
            coordinator?.signUp2Screen()
        } else {
            showToast(message: "Please fill all the fields properly")
        }
    }
    
    @IBAction func signInBtnAction(_ sender: Any) {
        coordinator?.signInScreen()
    }
    
    @IBAction func dobPressed(_ sender: Any) {
        let vc = CalenderPopUpViewController(nibName: "CalenderPopUpViewController", bundle: nil)
                vc.delegate = self
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: false, completion: nil)
    }
    
}

extension SignUp1ViewController: GetCalenderDetailsPopUp {
    func date(date: Date) {
        dobTF.text = date.dateToString("MM-dd-yyyy")
        dobSelected = true
    }

}

extension SignUp1ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if emailTF.text?.isValidEmail() ?? false && passwordTF.text?.isStrongPassword() ?? false && phoneTF.text?.isPhoneNumber ?? false && nameTF.hasText && genderDropDown.hasText && dobTF.hasText {
            print("btn enabled")
            btnEnabled = true
        }
        else {
            btnEnabled = false
        }
    }
}
