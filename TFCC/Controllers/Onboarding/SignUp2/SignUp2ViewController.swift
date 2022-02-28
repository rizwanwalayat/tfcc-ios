//
//  WelcomeViewController.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import UIKit

class SignUp2ViewController: BaseViewController {

    var selectedEconomic: String?
    var economicList = ["Rich", "Poor", "Middle"]
    var toolBar:UIToolbar = UIToolbar()
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var pickerView: UIView!
    
    @IBOutlet weak var economicConditionsTF: RoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
//        toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width:     UIScreen.main.bounds.width, height: 35))
//        toolBar.barStyle = UIBarStyle.default
//        toolBar.isTranslucent = true
//        toolBar.sizeToFit()
//        lazy var button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneAction(_ :)))
//        toolBar.setItems([button], animated: false)
//        toolBar.isUserInteractionEnabled = true
//        economicConditionsTF.inputView = pickerView
//        economicConditionsTF.inputAccessoryView = toolBar
//
//        pickerView.addSubview(toolBar)
        // Do any additional setup after loading the view.
    }


    
    @IBAction func signInBtnAction(_ sender: Any) {
        coordinator?.signInScreen()
    }
    
    func showPickerView(textField: UITextField){
        
//        textField.resignFirstResponder()
        UIView.animate(withDuration: 1) {
            self.pickerView.isHidden = false
        }
        
        
    }
    
    @IBAction func doneAction(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 1) {
            self.pickerView.isHidden = true
        }
        
    }
    
//    @objc func doneAction(_ sender: UIBarButtonItem){
//        view.endEditing(true)
//        pickerView.isHidden = true
//    }
}

extension SignUp2ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return economicList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return economicList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedEconomic = economicList[row]
        economicConditionsTF.text = selectedEconomic
    }
    
}

extension SignUp2ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        showPickerView(textField: textField)
        return false
    }
}
