//
//  PatientAppointmentDetailsViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 11/03/2022.
//

import UIKit

class PatientAppointmentDetailsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var detailsTextView: UITextView!
    
    //MARK: - Variables
    var coordinator: MainCoordinator?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - IBActions
    @IBAction func uploadMedicalRecordButtonAction(_ sender: UIButton) {
    }
    
    //MARK: - Selectors
    
    //MARK: - Private Methods
    private func setup() {
        detailsTextView.delegate = self
    }
}

extension PatientAppointmentDetailsViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        detailsTextView.text = ""
        detailsTextView.textColor = UIColor.darkBlueText
    }
    
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if detailsTextView.text.isReallyEmpty {
//            detailsTextView.text = "type_message".localized
//            detailsTextView.textColor = UIColor.grayBorder
//        } else {
//            detailsTextView.textColor = UIColor.darkBlueText
//        }
//    }
}
