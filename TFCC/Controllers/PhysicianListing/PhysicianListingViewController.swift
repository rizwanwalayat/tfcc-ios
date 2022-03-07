//
//  SearchSpecialistViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 25/02/2022.
//

import UIKit

class PhysicianListingViewController: BaseViewController {

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
                
        tableView.register(UINib(nibName: "PhysicianListingTableViewCell", bundle: nil), forCellReuseIdentifier: "PhysicianListingTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
      
    }
    
  
    
    //MARK: - IBActions
//    @IBAction func searchButtonAction(_ sender: UIButton) {
//        searchTextField.becomeFirstResponder()
//    }
}



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
