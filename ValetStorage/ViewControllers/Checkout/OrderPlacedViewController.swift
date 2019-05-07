//
//  OrderPlacedViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 5/5/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class OrderPlacedViewController: UIViewController {
    
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonOutlet.alpha = 0
        self.cardView.frame = self.cardView.frame.offsetBy(dx: 0, dy: 800)
        
        // UI settings
        buttonOutlet.layer.masksToBounds = false
        buttonOutlet.layer.cornerRadius = 12
        buttonOutlet.clipsToBounds = true
        buttonOutlet.backgroundColor = ColorScheme.valet_blue
        animate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OptionsView") as! UINavigationController
        self.present(vc, animated: true, completion: nil)
    }
    
    func animate() {
        UIView.animate(withDuration: 3, delay: 0.5, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.cardView.frame = self.cardView.frame.offsetBy(dx: 0, dy: -800)
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 3, animations: {
            self.buttonOutlet.alpha = 1
        }, completion: nil)
    }
    

}
