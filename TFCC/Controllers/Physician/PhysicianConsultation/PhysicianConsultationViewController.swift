//
//  PhysicianConsultationViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 18/03/2022.
//

import UIKit

class PhysicianConsultationViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
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
        
        self.tableView.register(UINib(nibName: "PhysicianConsultationTableCell", bundle: nil), forCellReuseIdentifier: "physicianConsultationTableCell")
    }
}

//MARK: - TableViewDelegates
extension PhysicianConsultationViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "physicianConsultationTableCell", for: indexPath) as! PhysicianConsultationTableCell
        
        return cell
    }
}
