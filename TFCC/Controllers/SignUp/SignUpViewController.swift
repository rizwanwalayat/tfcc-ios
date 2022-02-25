//
//  WelcomeViewController.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import UIKit

class SignUpViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signInBtnAction(_ sender: Any) {
        coordinator?.signInScreen()()
    }
    

}
