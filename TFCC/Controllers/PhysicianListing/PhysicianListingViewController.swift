//
//  SearchSpecialistViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 25/02/2022.
//

import UIKit

class PhysicianListingViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var searchTextField: UITextField!

    
    //MARK: - Variables
    var coordinator: MainCoordinator?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - Private Methods
    private func setup() {
        
//        searchTextField.delegate = self
        
        tableView.register(UINib(nibName: "PhysicianListingTableViewCell", bundle: nil), forCellReuseIdentifier: "PhysicianListingTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
      
    }
    
  
    
    //MARK: - IBActions
//    @IBAction func searchButtonAction(_ sender: UIButton) {
//        searchTextField.becomeFirstResponder()
//    }
}

//MARK: - UITextFieldDelegate
//extension PhysicianListingViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
//        if textField == searchTextField {
//            textField.resignFirstResponder()
//        }
//        return true
//    }
//}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension PhysicianListingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhysicianListingTableViewCell", for: indexPath) as! PhysicianListingTableViewCell
        
        return cell
    }
    
    
}
