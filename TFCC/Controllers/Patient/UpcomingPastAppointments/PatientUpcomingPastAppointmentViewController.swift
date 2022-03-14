//
//  PatientUpcomingPastAppointmentViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 14/03/2022.
//

import UIKit

class PatientUpcomingPastAppointmentViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var upcomingButton: UIButton!
    @IBOutlet weak var pastButton: UIButton!
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var coordinator: MainCoordinator?
    var isUpcomingButtonSelected = true
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - IBActions
    @IBAction func upcomingButtonAction(_ sender: UIButton) {
        screenTitleLabel.text = "Upcoming Appointments"
        isUpcomingButtonSelected = true
        toggleButton(selectedButton: upcomingButton)
        self.tableView.reloadData()
    }
    @IBAction func pastButtonAction(_ sender: UIButton) {
        screenTitleLabel.text = "Past Appointments"
        isUpcomingButtonSelected = false
        toggleButton(selectedButton: pastButton)
        self.tableView.reloadData()
    }
    
    //MARK: - Selectors
    
    //MARK: - Private Methods
    private func setup() {
        toggleButton(selectedButton: upcomingButton)
        tableView.register(UINib(nibName: "AppointmentsTableCell", bundle: nil), forCellReuseIdentifier: "appointmentsTableCell")
    }
    private func toggleButton(selectedButton: UIButton) {
            
            upcomingButton.backgroundColor = .WhiteBackground
            pastButton.backgroundColor = .WhiteBackground
            upcomingButton.setTitleColor(.BorderGrey, for: .normal)
            pastButton.setTitleColor(.BorderGrey, for: .normal)
            
            selectedButton.backgroundColor = .themeColor
            selectedButton.setTitleColor(.WhiteBackground, for: .normal)
        }
}

//MARK: - UITableViewDelegate
extension PatientUpcomingPastAppointmentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isUpcomingButtonSelected {
            return 3
        }
        else {
            return 5
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isUpcomingButtonSelected {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "appointmentsTableCell", for: indexPath) as! AppointmentsTableCell
            return cell
        }
        else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "appointmentsTableCell", for: indexPath) as! AppointmentsTableCell
            return cell
        }
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
