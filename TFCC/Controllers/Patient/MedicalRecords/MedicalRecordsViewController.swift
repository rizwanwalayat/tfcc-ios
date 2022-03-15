//
//  MedicalRecordsViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 14/03/2022.
//

import UIKit

class MedicalRecordsViewController: UIViewController {

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
        
        tableView.register(UINib(nibName: "MedicalRecordTableCell", bundle: nil), forCellReuseIdentifier: "medicalRecordTableCell")
    }
}

//MARK: - UITableViewDelegate
extension MedicalRecordsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "medicalRecordTableCell", for: indexPath) as! MedicalRecordTableCell
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20
    }
}

