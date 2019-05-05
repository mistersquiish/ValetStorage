//
//  CheckoutViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 5/4/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit
import Stripe

class EnterPaymentViewController: STPAddCardViewController  {
    
    var order: Order!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(confirmation))
        
        navigationItem.title = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func back(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func confirmation(_ sender: UIBarButtonItem) {
        let confirmationViewController = UIStoryboard(name: "Checkout", bundle: nil).instantiateViewController(withIdentifier: "Confirmation") as! ConfirmationViewController
        navigationController?.pushViewController(confirmationViewController, animated: true)
    }
}
