//
//  PricingViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/23/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class PricingViewController: UIViewController {

    @IBOutlet weak var optionNameLabel: UILabel!
    @IBOutlet weak var optionImageView: UIImageView!
    @IBOutlet weak var optionDescriptionLabel: UILabel!
    @IBOutlet weak var optionPriceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityAddButtonOutlet: UIButton!
    @IBOutlet weak var quantitySubtractButtonOutlet: UIButton!
    @IBOutlet weak var optionSubtotalLabel: UILabel!
    @IBOutlet weak var reviewSubtotalLabel: UILabel!
    @IBOutlet weak var reviewTaxLabel: UILabel!
    @IBOutlet weak var reviewMonthlyTotalLabel: UILabel!
    @IBOutlet weak var total3MonthLabel: UILabel!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    
    var orderType: OrderType!
    var order: Order!
    
    // variables to help calculate totals
    var subtotal: Float!
    var tax: Float!
    var monthlyTotal: Float!
    
    // variables for animated buttons
    var quantitySubtractImages: [UIImage] = []
    var quantityAddImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI settings
        quantityLabel.layer.borderWidth = 0.5
        quantityLabel.layer.borderColor = UIColor.gray.cgColor
        nextButtonOutlet.layer.masksToBounds = false
        nextButtonOutlet.layer.borderWidth = 0.5
        nextButtonOutlet.layer.cornerRadius = 12
        nextButtonOutlet.clipsToBounds = true
        nextButtonOutlet.backgroundColor = ColorScheme.valet_orange
        optionDescriptionLabel.text = orderType.pricingDescription
        // if option is 'Bins', use the secondary image
        if orderType.id == "5b5837ba4da6f3c0e03134bf" {
            optionImageView.image = orderType.optionsImage2
        } else {
            optionImageView.image = orderType.optionsImage
        }
        
        // create order
        order = Order()
        
        // call the API to retrieve pricing information and update UI
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        orderType.getOrderTypeInfo(completion: { () -> () in
            self.optionPriceLabel.text = formatter.string(from: NSNumber(value: self.orderType.price))
            self.optionDescriptionLabel.text = self.orderType.pricingDescription
            self.updateUI()
            self.order.orderType = self.orderType
        })
        
        // create image arrays for button animations
        quantitySubtractImages = createImageArray(imagePrefix: "quantity-subtract")
        quantityAddImages = createImageArray(imagePrefix: "quantity-add")
        
        // create order
        order = Order()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        subtotal = orderType.price * Float(quantityLabel.text!)!
        tax = subtotal * 0.0825
        monthlyTotal = subtotal + tax
        // update labels
        optionSubtotalLabel.text = formatter.string(from: NSNumber(value: subtotal))
        reviewSubtotalLabel.text = formatter.string(from: NSNumber(value: subtotal))
        reviewTaxLabel.text = formatter.string(from: NSNumber(value: tax))
        reviewMonthlyTotalLabel.text = formatter.string(from: NSNumber(value: monthlyTotal))
        total3MonthLabel.text = formatter.string(from: NSNumber(value: monthlyTotal * 3))
    }
    
    @IBAction func quantityAddButton(_ sender: Any) {
        quantityLabel.text = String(Int(quantityLabel.text!)! + 1)
        animate(imageView: quantityAddButtonOutlet.imageView!, images: quantityAddImages)
        updateUI()
        
    }
    
    @IBAction func quantitySubtractButton(_ sender: Any) {
        if Int(quantityLabel.text!)! > 1 {
            quantityLabel.text = String(Int(quantityLabel.text!)! - 1)
            animate(imageView: quantitySubtractButtonOutlet.imageView!, images: quantitySubtractImages)
            updateUI()
        }
    }
    
    // creates the array to be passed to the quantity add and subtract button image views
    // Because there is only one image, this function isn't necessary
    func createImageArray(imagePrefix: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        for imageCount in 1..<2 {
            let imageName = "\(imagePrefix)-\(imageCount)"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 0.25
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InputAddressSegue" {
            let inputAddressViewController = segue.destination as! InputAddressViewController
            inputAddressViewController.order = order
        }
        
    }
}
