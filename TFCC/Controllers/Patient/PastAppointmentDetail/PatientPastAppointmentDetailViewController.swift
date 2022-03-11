//
//  PatientPastAppointmentDetailViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 09/03/2022.
//

import UIKit

class PatientPastAppointmentDetailViewController: UIViewController {

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
        
        self.tableView.register(UINib(nibName: "AppointmentTimeTableCell", bundle: nil), forCellReuseIdentifier: "appointmentTimeTableCell")
        self.tableView.register(UINib(nibName: "AppointmentDetailCell", bundle: nil), forCellReuseIdentifier: "appointmentDetailCell")
        self.tableView.register(UINib(nibName: "MedicalRecordCell", bundle: nil), forCellReuseIdentifier: "medicalRecordCell")
    }
}

//MARK: - TableViewDelegates
extension PatientPastAppointmentDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 5
        }
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "appointmentTimeTableCell", for: indexPath) as! AppointmentTimeTableCell
            
            return cell

        }
        else if indexPath.section == 1 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "appointmentDetailCell", for: indexPath) as! AppointmentDetailCell
            
            return cell
        }
        else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "medicalRecordCell", for: indexPath) as! MedicalRecordCell
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        
        let label = UILabel(frame: CGRect.zero)
        if let font = UIFont(name:"Lato-Bold", size: 14.0) {
            label.font = font
        }
        label.textColor = UIColor.darkBlueText
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        
        label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10).isActive = true
        NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: headerView, attribute: .leading, multiplier: 1, constant: 16).isActive = true
        
        switch section {
        case 0:
            return UIView()
        case 1:
            label.text = "Details"
        case 2:
            label.text = "Medical Records"
        default:
            break
        }
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 30
    }
}
