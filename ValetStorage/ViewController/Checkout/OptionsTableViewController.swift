//
//  OptionsTableViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/9/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class OptionsTableViewController: UITableViewController {
    
    var valetStorageOptions = ["Bins", "5x5", "5x10", "10x10", "7.5x10", "10x15"]
    var valetStorageOptionImages = ["Options-1", "Options-2", "Options-3", "Options-4", "Options-5", "Options-6"]

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
