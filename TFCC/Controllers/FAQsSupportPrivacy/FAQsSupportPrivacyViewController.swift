//
//  FAQsSupportPrivacyViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 04/03/2022.
//

import UIKit

class FAQsSupportPrivacyViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var FAQsButton: UIButton!
    @IBOutlet weak var supportButton: UIButton!
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var screenTitleLabel: UILabel!
    
    // FAQS View
    @IBOutlet var FAQsView: UIView!
    @IBOutlet var supportView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // Support View
    @IBOutlet weak var questionTitle: UITextField!
    @IBOutlet weak var qustionDetailTextField: CustomTextField!{
        didSet {
            qustionDetailTextField.placeholderRect(forBounds: CGRect(x: 10, y: 0 , width: 60, height: 50))
        }
    }
    @IBOutlet weak var checkMarkButton: UIButton!
    
    //MARK: - Variables
    var coordinator: MainCoordinator?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - IBActions
    @IBAction func FAQsButtonAction(_ sender: UIButton) {
        toggleButton(selectedButton: FAQsButton)
        screenTitleLabel.text = "FAQs"
        FAQsView.isHidden = false
        supportView.isHidden = true
    }
    @IBAction func supportButtonAction(_ sender: UIButton) {
        toggleButton(selectedButton: supportButton)
        screenTitleLabel.text = "Support"
        FAQsView.isHidden = true
        supportView.isHidden = false
    }
    @IBAction func privacyButtonAction(_ sender: UIButton) {
        toggleButton(selectedButton: privacyButton)
        screenTitleLabel.text = "Privacy Policy"
    }
    
    // Support View
    @IBAction func checkmarkButtonAction(_ sender: UIButton) {
        
    }
    
    //MARK: - Selectors
    
    //MARK: - Private Methods
    private func setup() {
        toggleButton(selectedButton: FAQsButton)
        popupViewConstraints(toView: FAQsView, topConstraint: 194)
        popupViewConstraints(toView: supportView, topConstraint: 194)
        FAQsView.isHidden = false
        supportView.isHidden = true
        tableView.register(UINib(nibName: "FAQsTableCell", bundle: nil), forCellReuseIdentifier: "faqCell")
    }
    private func toggleButton(selectedButton: UIButton) {
        
        FAQsButton.backgroundColor = .WhiteBackground
        supportButton.backgroundColor = .WhiteBackground
        privacyButton.backgroundColor = .WhiteBackground
        FAQsButton.setTitleColor(.BorderGrey, for: .normal)
        supportButton.setTitleColor(.BorderGrey, for: .normal)
        privacyButton.setTitleColor(.BorderGrey, for: .normal)
        
        selectedButton.backgroundColor = .themeColor
        selectedButton.setTitleColor(.WhiteBackground, for: .normal)
    }
    func popupViewConstraints(toView: UIView, topConstraint: CGFloat){
        self.view.addSubview(toView)
        toView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            toView.topAnchor.constraint(equalTo: view.topAnchor,constant: topConstraint),
            toView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            toView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
        ])
    }
}

extension FAQsSupportPrivacyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "faqCell", for: indexPath) as! FAQsTableCell
        cell.config(indexPath: indexPath)
        return cell
    }
}
