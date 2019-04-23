//
//  OptionsCollectionViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/23/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class OptionsCollectionViewController: UICollectionViewController, UIGestureRecognizerDelegate {
    
    var valetStorageOptions = ["Bins", "5' X 5' Unit", "5' X 10' Unit", "10' X 10' Unit", "7.5' X 10' Unit", "10' X 15' Unit"]
    
    var valetStorageOptionImages = ["Options-1", "Options-2", "Options-3", "Options-4", "Options-5", "Options-6"]
    
    var valetStorageDesc = ["Perfect for unloading a few bins of winter clothes or childhood memorabilia.", "Free up your garage, or store baby gear until you need it again.", "Large walk-in closet. Anything you can fit there, fits here!", "Universal size that will fit almost anyone’s needs.  Perfect closet size.", "The size of a guest bedroom. Use ours if you don’t have your own!", "If you have more than just one bedroom, this will be plenty to help you out."]
    
    var valetStoragePrice = ["$6/month", "$66/month", "$85/month", "$123/month", "$184/month", "$260/month"]
    var valetStorageSpace = ["Bins are 17″ x 27″ x 12″", "130 cubic feet of usable space.", "260 cubic feet of usable space.", "390 cubic feet of usable space.", "520 cubic feet of usable space.", "780 cubic feet of usable space."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(signOut))

        let pressGesture = UILongPressGestureRecognizer(target: self, action: #selector(holdCell(recognizer:)))
        pressGesture.minimumPressDuration = 1
        collectionView?.addGestureRecognizer(pressGesture)
        pressGesture.delegate = self
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
        cell.optionsNameLabel.text = valetStorageOptions[indexPath.row]
        cell.optionImage.image = UIImage(named: valetStorageOptionImages[indexPath.row])
        cell.price.text = valetStoragePrice[indexPath.row]
        cell.space.text = valetStorageSpace[indexPath.row]
        cell.optionDesc.text = valetStorageDesc[indexPath.row]
    
        return cell
    }
    
    @objc func signOut(_ sender: UIBarButtonItem) {
        TokenKeychain.clearAccessToken()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginView") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PricingSegue" {
            let cell = sender as! UICollectionViewCell
            if let indexPath = collectionView?.indexPath(for: cell) {
                let option = valetStorageOptions[indexPath.row]
                let pricingViewController = segue.destination as! PricingViewController
                pricingViewController.option = option
            }
        }
    }
    
    @objc func holdCell(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.began {
            let pressedLocation = recognizer.location(in: self.collectionView)
            if let pressedIndexPath = self.collectionView?.indexPathForItem(at: pressedLocation) {
                if let pressedCell = self.collectionView?.cellForItem(at: pressedIndexPath) as? OptionsCollectionCell {
                    // do cell animation
                }
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
