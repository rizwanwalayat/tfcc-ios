//
//  WelcomeViewController.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import UIKit

class SignUpViewController: BaseViewController {

    @IBOutlet weak var emailTF: RoundTextField!
    @IBOutlet weak var genderTF: RoundTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func nextBtnAction(_ sender: Any) {
        coordinator?.signUp2Screen()
    }
    
    @IBAction func signInBtnAction(_ sender: Any) {
        coordinator?.signInScreen()
    }
    @IBAction func genderAction(_ sender: Any) {
        self.pickerView()
    }
    
}

