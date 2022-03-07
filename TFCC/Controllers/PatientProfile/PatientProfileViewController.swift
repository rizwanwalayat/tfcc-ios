//
//  SearchSpecialistViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 25/02/2022.
//

import UIKit

class PatientProfileViewController: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var searchTextField: UITextField!

    
    //MARK: - Variables

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }
    
    //MARK: - Private Methods
   
    private func setup() {
                
        tableView.register(UINib(nibName: "PatientProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "PatientProfileTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
      
    }
  
    
    //MARK: - IBActions
//    @IBAction func searchButtonAction(_ sender: UIButton) {
//        searchTextField.becomeFirstResponder()
//    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension PatientProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientProfileTableViewCell", for: indexPath) as! PatientProfileTableViewCell
        switch indexPath.row {
        case 0:
            cell.config(label: "Age", value: "35")
        case 1:
            cell.config(label: "Email Address", value: "Johndoe@email.com")
        case 2:
            cell.config(label: "Password:", value: "111-222-333")
        case 3:
            cell.config(label: "Phone Number:", value: "111-222-333")
        case 4:
            cell.config(label: "Date of Birth:", value: "MM-DD-YYYY")
        case 5:
            cell.config(label: "Gender:", value: "MM-DD-YYYY")
        case 6:
            cell.config(label: "Economic Conditions:", value: "Middle class")
        case 7:
            cell.config(label: "Social State:", value: "Stable")
        case 8:
            cell.config(label: "City:", value: "Washington D.C")
        case 9:
            cell.config(label: "Country:", value: "America")
        case 10:
            cell.configButton()
        default:
            print("default")
        }
        return cell
    }
    
    
}
