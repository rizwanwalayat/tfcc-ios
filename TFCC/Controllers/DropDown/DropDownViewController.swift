//
//  DropDownViewController.swift
//  EasyGift
//
//  Created by MAC on 05/01/2022.
//  Copyright © 2022 codesrbit. All rights reserved.
//

import UIKit

protocol DropdownDelegate {
    func didSelect(_ selectedYear: String)
}
class DropDownViewController: UIViewController {

    // MARK: - Outlets -
    
    @IBOutlet weak var contentView : UIView!
    @IBOutlet weak var popupView : UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    
    // MARK: - Variables Declarations -
    
    var tableViewDataSource = [String]()
    var contentViewsFrame = CGRect()
    var delegate : DropdownDelegate?
    
    
    // MARK: - Controller's LifeCycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /// here we're calculting max difference of screen and view from starts, so that popup don't exceed to main screen's hight
        let estimatedMaxHeight = (ScreenSize.SCREEN_HEIGHT - contentViewsFrame.minY) - 200
        let estimatedPopupHeight = CGFloat(tableViewDataSource.count * 40)
        
        var frame = popupView.bounds
        
        if estimatedPopupHeight > estimatedMaxHeight {
            
            frame = CGRect(x: contentViewsFrame.minX, y: contentViewsFrame.maxY, width: frame.width, height: estimatedMaxHeight)
        }
        else {
    
            frame = CGRect(x: contentViewsFrame.minX, y: contentViewsFrame.maxY, width: frame.width, height: estimatedPopupHeight)
        }

        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [],  animations: {

            self.contentView.alpha = 1
            self.popupView.frame = frame
        })
        
//        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut) {
//            self.popupView.frame = frame
//
//        }
        
    }
    
    // MARK: - Custom Methods -
    
    fileprivate func setup()
    {
        // - Tableview Related -
        tableView.register(UINib(nibName: "DropdownTableViewCell", bundle: nil), forCellReuseIdentifier: "DropdownTableViewCell")
        tableView.reloadData()

        
        // - Popup UI Related -
        
        let frame = CGRect(x: contentViewsFrame.minX, y: contentViewsFrame.maxY, width: contentViewsFrame.width, height: 0)
        
        popupView.frame = frame
        contentView.alpha = 0
        backButton.setTitle("", for: .normal)
    }
    
    fileprivate func hidePopup()
    {

        var frame = popupView.bounds
        frame = CGRect(x: contentViewsFrame.minX, y: contentViewsFrame.maxY, width: frame.width, height: 0)
        
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut) {
            self.popupView.frame = frame
            self.contentView.alpha = 0
            
        } completion: { completed in
            
            if completed {
                self.dismiss(animated: false, completion: nil)
            }
        }

    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        hidePopup()
    }
    
}

extension DropDownViewController : UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropdownTableViewCell", for: indexPath) as! DropdownTableViewCell
        cell.cellTitleLable.text = tableViewDataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(tableViewDataSource[indexPath.row])
        hidePopup()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
