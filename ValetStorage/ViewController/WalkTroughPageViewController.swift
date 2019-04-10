//
//  WalkTroughPageViewController.swift
//  ValetStorage
//
//  Created by Jerry Sun on 4/3/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class WalkTroughPageViewController: UIPageViewController , UIPageViewControllerDataSource{
    // MARK - Properties
    
    var pageHeadings = ["You Pack", "Save Time", "Get Your Stuff"]
    var pageImages = ["Onboarding - 1", "Onboarding - 2","Onboarding - 3"]
    var pageSubHeading = ["Sign up for the space you need. Pack and stage your stuff, and let us know when it’s ready!", "Our friendly storage experts will take care of everything. (At no extra cost!)", "Request your water skis in May, and your holiday bins in November. Manage all your stuff from any device."]
    
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the data source to itself
        dataSource = self
        //create the first walkthrough screen
        if let startingViewController = contentViewController(at: 0){
            setViewControllers([startingViewController], direction: .forward,animated: true, completion: nil)
        

        // Do any additional setup after loading the view.
    }
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkThroughContentController).index
        index -= 1
        
        return contentViewController(at: index)
        
    }
    
    
    // MARK: - Helper
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkThroughContentController).index
        index += 1
        
        return contentViewController(at: index)
        
    }
    
    func contentViewController(at index: Int) -> WalkThroughContentController?{
        if index < 0 || index >= pageHeadings.count{
        return nil
    }
        // create new view controller and pass suitable data
        let storyboard = UIStoryboard(name: "OnBoarding", bundle: nil)
        
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkThroughContentController") as? WalkThroughContentController {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeading[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
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
