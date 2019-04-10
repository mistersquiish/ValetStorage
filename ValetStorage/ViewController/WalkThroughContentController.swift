//
//  WalkThroughContentController.swift
//  ValetStorage
//
//  Created by Jerry Sun on 4/3/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class WalkThroughContentController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var headinglabel: UILabel! {
        didSet{
            headinglabel.numberOfLines = 0
        }
    }
    @IBOutlet var subHeadingLabel: UILabel! {
        didSet {
            subHeadingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentImageView: UIImageView!
    
    // MARK: - Properties
    
    var index = 0
    var heading = ""
    var subHeading = ""
    var imageFile = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headinglabel.text = heading
        subHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)

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
