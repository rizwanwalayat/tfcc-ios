//
//  EditPatientProfileViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 09/03/2022.
//

import UIKit

class EditPatientProfileViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var DOBTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var economyTextField: UITextField!
    @IBOutlet weak var socialTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    
    //MARK: - Variables
    var coordinator: MainCoordinator?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - IBActions
    
    //MARK: - Selectors
    
    //MARK: - Private Methods
    private func setup() {
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name: Jane Doe", attributes: [NSAttributedString.Key.foregroundColor: UIColor.BorderGrey])
        ageTextField.attributedPlaceholder = NSAttributedString(string: "Age: 35", attributes: [NSAttributedString.Key.foregroundColor: UIColor.BorderGrey])
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email Address: Johndoe@email.com", attributes: [NSAttributedString.Key.foregroundColor: UIColor.BorderGrey])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password: 111-222-333", attributes: [NSAttributedString.Key.foregroundColor: UIColor.BorderGrey])
        phoneTextField.attributedPlaceholder = NSAttributedString(string: "Phone Number: 111-222-333", attributes: [NSAttributedString.Key.foregroundColor: UIColor.BorderGrey])
        DOBTextField.attributedPlaceholder = NSAttributedString(string: "Date of Birth: MM-DD-YYYY", attributes: [NSAttributedString.Key.foregroundColor: UIColor.BorderGrey])
        genderTextField.attributedPlaceholder = NSAttributedString(string: "Gender: Female", attributes: [NSAttributedString.Key.foregroundColor: UIColor.BorderGrey])
        economyTextField.attributedPlaceholder = NSAttributedString(string: "Economic Conditions: Middle class", attributes: [NSAttributedString.Key.foregroundColor: UIColor.BorderGrey])
        socialTextField.attributedPlaceholder = NSAttributedString(string: "Social State: Stable", attributes: [NSAttributedString.Key.foregroundColor: UIColor.BorderGrey])
        cityTextField.attributedPlaceholder = NSAttributedString(string: "City: Washington D.C", attributes: [NSAttributedString.Key.foregroundColor: UIColor.BorderGrey])
        countryTextField.attributedPlaceholder = NSAttributedString(string: "Country: America", attributes: [NSAttributedString.Key.foregroundColor: UIColor.BorderGrey])
    }
}
