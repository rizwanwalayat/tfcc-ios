//
//  WelcomeViewController.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import UIKit

class SignInViewController: BaseViewController {

    @IBOutlet weak var emailTF: RoundTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func nextBtnAction(_ sender: Any) {
        coordinator?.searchSpecialistScreen()
    }
    
    @IBAction func forgotPasswordBtnAction(_ sender: Any) {
        coordinator?.forgotPasswordScreen()
    }
    
}

