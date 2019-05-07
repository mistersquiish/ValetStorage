//
//  OptionsCollectionViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/23/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class OptionsCollectionViewController: UICollectionViewController {
    
    var valetStorageOptionNames = ["Bins", "5' X 5' Unit", "5' X 10' Unit", "7.5' X 10' Unit", "10' X 10' Unit", "10' X 15' Unit"]
    var valetStorageOptions: [OrderType?]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create the OrderType variables for all the options and add to list
        for names in self.valetStorageOptionNames {
            self.valetStorageOptions.append(OrderType(orderType: names))
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(signOut))
        
        navigationItem.rightBarButtonItem?.tintColor = ColorScheme.valet_blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return valetStorageOptions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OptionsCell", for: indexPath) as! OptionsCollectionCell
        let orderType = valetStorageOptions[indexPath.row]
        cell.optionsNameLabel.text = orderType?.name
        cell.optionImage.image = orderType?.optionsImage
        cell.price.text = orderType?.optionsPriceStr
        cell.space.text = orderType?.optionsSize
        cell.optionDesc.text = orderType?.optionsDescription
    
        return cell
    }
    
    @objc func signOut(_ sender: UIBarButtonItem) {
        TokenKeychain.clearAccessToken()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginView") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PricingSegue" {
            let cell = sender as! OptionsCollectionCell
            if let indexPath = collectionView?.indexPath(for: cell) {
                let option = valetStorageOptions[indexPath.row]
                let pricingViewController = segue.destination as! PricingViewController
                pricingViewController.orderType = option
            }
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
