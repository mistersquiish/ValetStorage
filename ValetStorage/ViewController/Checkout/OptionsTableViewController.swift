//
//  OptionsTableViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/9/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class OptionsTableViewController: UITableViewController {
    
    var valetStorageOptions = ["Bins", "5' X 5' Unit", "5' X 10' Unit", "10' X 10' Unit", "7.5' X 10' Unit", "10' X 15' Unit"]
    
    var valetStorageOptionImages = ["Options-1", "Options-2", "Options-3", "Options-4", "Options-5", "Options-6"]
    
    var valetStorageDesc = ["Perfect for unloading a few bins of winter clothes or childhood memorabilia.", "Free up your garage, or store baby gear until you need it again.", "Large walk-in closet. Anything you can fit there, fits here!", "Universal size that will fit almost anyone’s needs.  Perfect closet size.", "The size of a guest bedroom. Use ours if you don’t have your own!", "If you have more than just one bedroom, this will be plenty to help you out."]
    
    var valetStoragePrice = ["$6/month", "$66/month", "$85/month", "$123/month", "$184/month", "$260/month"]
    var valetStorageSpace = ["Bins are 17″ x 27″ x 12″", "130 cubic feet of usable space.", "260 cubic feet of usable space.", "390 cubic feet of usable space.", "520 cubic feet of usable space.", "780 cubic feet of usable space."]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(signOut))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return valetStorageOptions.count
    }

    @objc func signOut(_ sender: UIBarButtonItem) {
        TokenKeychain.clearAccessToken()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginView") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionsCell", for: indexPath) as! OptionsTableViewCell
        cell.optionsNameLabel.text = valetStorageOptions[indexPath.row]
        cell.optionImage.image = UIImage(named: valetStorageOptionImages[indexPath.row])
        cell.price.text = valetStoragePrice[indexPath.row]
        cell.space.text = valetStorageSpace[indexPath.row]
        cell.optionDesc.text = valetStorageDesc[indexPath.row]
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
