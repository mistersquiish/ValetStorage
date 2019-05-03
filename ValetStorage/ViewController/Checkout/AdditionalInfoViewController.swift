//
//  InputAdditionalInfoViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 5/2/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class AdditionalInfoViewController: UICollectionViewController, nextButtonDelegate {
    

    var additionalInfoQuestions = ["Do you have items that require 2 people to handle?\n(e.g. beds, sofas, tables)", "Do you have bulky items that require added handling?\n(e.g. armoires, ellipticals, treadmills, appliances)", "Do you have items that easily break and need extra love?\n(e.g. lamps, mirrors, electronics, artwork)", "Do you need us to climb 2+ flights of stairs to get to your stuff?", "Do you have items that we'll need to dissemble for you?"]
    var additionalInfoImageStrings = ["AdditionalInfo-1", "AdditionalInfo-2", "AdditionalInfo-3" ,"AdditionalInfo-4" ,"AdditionalInfo-5" ]
    
    var cells: [AdditionalInfoCell?] = []
    var order: Order!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return additionalInfoQuestions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdditionalInfoCell", for: indexPath) as! AdditionalInfoCell
        cell.imageView.image = UIImage(named: additionalInfoImageStrings[indexPath.row])
        cell.questionLabel.text = additionalInfoQuestions[indexPath.row]
        if !cells.contains(cell) {
            cells.append(cell)
        }
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionElementKindSectionFooter) {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath) as! NextButtonFooterView
            footerView.nextDelegate = self
            return footerView
        } else if (kind == UICollectionElementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            // Customize headerView here
            return headerView
        }
        fatalError()
    }
    
    func nextButton() {
        var allChecked = true
        for cell in cells {
            if !(cell?.hasSelected)! {
                allChecked = false
            }
        }
        
        if allChecked {
            self.performSegue(withIdentifier: "CheckoutSegue", sender: nil)
        }
    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
