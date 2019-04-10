//
//  WalkThroughViewController.swift
//  ValetStorage
//
//  Created by Jerry Sun on 4/6/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class WalkThroughViewController: UIViewController {

    // MARK - Outlets
    @IBOutlet var pageControl:UIPageControl!
    
    @IBOutlet var nextButton: UIButton! {
        didSet{
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var skipButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
