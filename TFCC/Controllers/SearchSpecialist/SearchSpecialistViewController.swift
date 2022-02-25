//
//  SearchSpecialistViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 25/02/2022.
//

import UIKit

class SearchSpecialistViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var bannersCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Variables
    var coordinator: MainCoordinator?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - Private Methods
    private func setup() {
        searchTextField.delegate = self
        bannersCollectionView.register(UINib(nibName: "BannerCollectionCell", bundle: nil), forCellWithReuseIdentifier: "bannerCollectionCell")
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionCell", bundle: nil), forCellWithReuseIdentifier: "categoriesCollectionCell")
    }
    
    //MARK: - IBActions
    @IBAction func searchButtonAction(_ sender: UIButton) {
        searchTextField.becomeFirstResponder()
    }
}

//MARK: - UITextFieldDelegate
extension SearchSpecialistViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == searchTextField {
            textField.resignFirstResponder()
        }
        return true
    }
}

//MARK: - UICollectionView Delegates
extension SearchSpecialistViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannersCollectionView {
            return 2
        }
        else if collectionView == categoriesCollectionView {
            let heightOfcollectionViewLineSpacing = (11 / 3) * 30
            let heightOfCollectionViewCells = ((11 / 3) * (bannersCollectionView.bounds.width/3 - (32 - 29)))
            categoriesCollectionViewHeightConstraint.constant = CGFloat(heightOfcollectionViewLineSpacing) + heightOfCollectionViewCells + 50
            return 11
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == bannersCollectionView {
            let cell = bannersCollectionView.dequeueReusableCell(withReuseIdentifier: "bannerCollectionCell", for: indexPath) as! BannerCollectionCell
            
            return cell
        }
        else if collectionView == categoriesCollectionView {
            let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCollectionCell", for: indexPath) as! CategoriesCollectionCell
            cell.circularView.cornerRadius = (bannersCollectionView.bounds.width/3 - 32) / 2
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == bannersCollectionView {
            return CGSize(width: bannersCollectionView.bounds.width - 32, height: 170)
        }
        else if collectionView == categoriesCollectionView {
            return CGSize(width: bannersCollectionView.bounds.width/3 - 32, height: bannersCollectionView.bounds.width/3 - (32 - 29))
        }
        return CGSize(width: 0, height: 0)
    }
}
