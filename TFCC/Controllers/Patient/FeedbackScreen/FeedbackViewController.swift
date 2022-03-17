//
//  FeedbackViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 17/03/2022.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var feedbackTextView: UITextView!{
        didSet {
            feedbackTextView.textContainerInset = UIEdgeInsets(top: 12, left: 15, bottom: 12, right: 15)
        }
    }
    
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
