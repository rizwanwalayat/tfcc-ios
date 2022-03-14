//
//  PatientAppointmentDetailsViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 11/03/2022.
//

import UIKit

class PatientAppointmentDetailsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var detailsTextView: UITextView! {
        didSet {
            detailsTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
    
    //MARK: - Variables
    var coordinator: MainCoordinator?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - IBActions
    @IBAction func uploadMedicalRecordButtonAction(_ sender: UIButton) {
        textViewDidEndEditing(detailsTextView)
    }
    
    //MARK: - Selectors
    
    //MARK: - Private Methods
    private func setup() {
        detailsTextView.delegate = self
        hideKeyboardWhenTappedAround()
    }
}

extension PatientAppointmentDetailsViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        detailsTextView.text = ""
        detailsTextView.textColor = UIColor.darkBlueText
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if detailsTextView.text.isReallyEmpty {
            detailsTextView.text = type_here_text
            detailsTextView.textColor = UIColor.BorderGrey
        } else {
            detailsTextView.textColor = UIColor.darkBlueText
        }
    }
}
