//
//  WelcomeViewController.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import UIKit

class SignUp3TOSViewController: BaseViewController {
    var blurEffectView: UIVisualEffectView!
    var viewModel: SignUpVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
            self.blurEffectView.frame = self.view.bounds
            self.blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.blurEffectView.alpha = 0.8;
        self.view.addSubview(blurEffectView)
        self.view.sendSubviewToBack(blurEffectView)
        // Do any additional setup after loading the view.
    }
    
    func saveSignUpData(){
        viewModel?.createAccount({ data, error, success, message in
            print(data)
            self.coordinator?.searchSpecialistScreen()

        })
    }
    
    @IBAction func agreeBtnAction(_ sender: Any) {
       saveSignUpData()
    }
    
    @IBAction func continueBtnAction(_ sender: Any) {
        self.dismiss(animated: true) {
            self.saveSignUpData()
        }
    }
    

}
