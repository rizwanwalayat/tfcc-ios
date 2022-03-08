//
//  PhysicianProfileViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 07/03/2022.
//

import UIKit

class PhysicianProfileViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Variables
    var coordinator: MainCoordinator?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tableView.removeObserver(self, forKeyPath: "contentSize")
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        
        if let obj = object as? UITableView,
           obj == self.tableView &&
            keyPath == "contentSize" {
            tableViewHeightConstraint.constant = tableView.contentSize.height
        }
    }

//MARK: - IBActions
    
    //MARK: - Selectors
    
    //MARK: - Private Methods
    private func setup() {
        tableView.register(UINib(nibName: "PhysicianEducationTableCell", bundle: nil), forCellReuseIdentifier: "physicianEducationTableCell")
    }
}

//MARK: - UITableViewDelegate
extension PhysicianProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "physicianEducationTableCell", for: indexPath) as! PhysicianEducationTableCell
        return cell
    }
}
