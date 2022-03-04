//
//  PatientSubCategoryViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 03/03/2022.
//

import UIKit

class PatientSubCategoryViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var bannersCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Variables
    var coordinator: MainCoordinator?
    var categoriesCount = 6
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - IBActions
    @IBAction func searchButtonAction(_ sender: UIButton) {
        searchTextField.becomeFirstResponder()
    }
    
    //MARK: - Private Methods
    private func setup() {
        searchTextField.delegate = self
        bannersCollectionView.register(UINib(nibName: "BannerCollectionCell", bundle: nil), forCellWithReuseIdentifier: "bannerCollectionCell")
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionCell", bundle: nil), forCellWithReuseIdentifier: "categoriesCollectionCell")
        categoriesCollectionView.register(UINib(nibName: "CollectionViewHeaderLine", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderLine")
        (categoriesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.headerReferenceSize = CGSize(width: categoriesCollectionView.bounds.width, height: 10)
    }
}

//MARK: - UITextFieldDelegate
extension PatientSubCategoryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == searchTextField {
            textField.resignFirstResponder()
        }
        return true
    }
}

//MARK: - UICollectionView Delegates
extension PatientSubCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == categoriesCollectionView {
            if categoriesCount % 2 == 1 {
                return (categoriesCount / 2) + 1
            }
            else {
                return categoriesCount / 2
            }
        }
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannersCollectionView {
            return 2
        }
        else if collectionView == categoriesCollectionView {
            
            // Setting CollectionView Height
            var totalRows = 0
            if categoriesCount % 2 == 1 {
                totalRows = (categoriesCount / 2) + 1
            }
            else {
                totalRows = categoriesCount / 2
            }
            let heightOfcollectionViewLineSpacing = totalRows * 30
            let oneCellHeight = (categoriesCollectionView.bounds.width/2) - 52
            let heightOfCollectionViewCells = CGFloat(totalRows) * oneCellHeight
            categoriesCollectionViewHeightConstraint.constant =  CGFloat(heightOfcollectionViewLineSpacing) + heightOfCollectionViewCells + 50
            
            if categoriesCount % 2 == 1 {
                if section == categoriesCount / 2 {
                    return 1
                }
                return 2
            }
            else {
                return 2
            }
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
            cell.circularView.cornerRadius = (bannersCollectionView.bounds.width/2 - 78) / 2
            cell.config(indexPath: indexPath)
            
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == bannersCollectionView {
            return CGSize(width: bannersCollectionView.bounds.width - 32, height: 170)
        }
        else if collectionView == categoriesCollectionView {
            return CGSize(width: categoriesCollectionView.bounds.width/2 - 52, height: categoriesCollectionView.bounds.width/2 - 52)
        }
        return CGSize(width: 0, height: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == categoriesCollectionView {
            return 52
        }
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == categoriesCollectionView {
            return 200
        }
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {

        case UICollectionView.elementKindSectionHeader:

            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderLine", for: indexPath) as! CollectionViewHeaderLine
//            if indexPath.section == 0 {
//                headerView.headerLineView.isHidden = true
//            }
            return headerView

        default:
            break
        }
        return UICollectionReusableView()
    }
}
