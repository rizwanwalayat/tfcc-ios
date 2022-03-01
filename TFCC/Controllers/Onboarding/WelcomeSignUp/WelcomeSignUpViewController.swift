//
//  WelcomeViewController.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import UIKit

class WelcomeSignUpViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signUpBtnAction(_ sender: Any) {
        coordinator?.signUpScreen()
    }
    
    @IBAction func signInBtnAction(_ sender: Any) {
        coordinator?.signInScreen()
    }
    
    
    @IBAction func skipBtnAction(_ sender: Any) {
        coordinator?.searchSpecialistScreen()
    
    }
}
