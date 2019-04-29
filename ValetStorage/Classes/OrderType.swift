//
//  OrderType.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/26/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import Foundation
import Alamofire

class OrderType {
    var name: String!
    var price: Float! = 0
    var id: String!
    
    var optionsImage: UIImage!
    var optionsImage2: UIImage!
    var optionsDescription: String!
    var optionsPriceStr: String!
    var optionsSize: String!
    
    var pricingDescription: String!
    var pricingRetrieved: Bool = false
    
    init(orderType: String!) {
        switch orderType {
        case "Bins":
            self.name = orderType
            self.optionsImage = UIImage(named: ("Options-1"))
            self.optionsImage2 = UIImage(named: ("Pricing-1"))
            self.optionsDescription = "Perfect for unloading a few bins of winter clothes or childhood memorabilia."
            self.optionsPriceStr = "$6/month"
            self.optionsSize = "Bins are 17″ x 27″ x 12″"
            self.id = "5b5837ba4da6f3c0e03134bf"
            self.pricingDescription = "Bin Dimensions 27″ x 17″ x 12″ (3-Cubic Ft) \n Each bin is $"
        case "5' X 5' Unit":
            self.name = orderType
            self.optionsImage = UIImage(named: ("Options-2"))
            self.optionsDescription = "Free up your garage, or store baby gear until you need it again."
            self.optionsPriceStr = "$66/month"
            self.optionsSize = "130 cubic feet of usable space."
            self.id = "5b58384c4da6f3c0e03134d4"
            self.pricingDescription = "Unit Dimensions 5' x 5' (25 sq.ft) \n Each Unit is $"
        case "5' X 10' Unit":
            self.name = orderType
            self.optionsImage = UIImage(named: ("Options-3"))
            self.optionsDescription = "Large walk-in closet. Anything you can fit there, fits here!"
            self.optionsPriceStr = "$85/month"
            self.optionsSize = "260 cubic feet of usable space."
            self.id = "5b58389e4da6f3c0e03134da"
            self.pricingDescription = "Unit Dimensions 5' x 10' (50 sq.ft) \n Each Unit is $"
        case "7.5' X 10' Unit":
            self.name = orderType
            self.optionsImage = UIImage(named: ("Options-4"))
            self.optionsDescription = "Universal size that will fit almost anyone’s needs.  Perfect closet size."
            self.optionsPriceStr = "$123/month"
            self.optionsSize = "390 cubic feet of usable space."
            self.id = "5b60439987280c518c974b38"
            self.pricingDescription = "Unit Dimensions 7.5' x 10' (75 sq.ft) \n Each Unit is $"
        case "10' X 10' Unit":
            self.name = orderType
            self.optionsImage = UIImage(named: ("Options-5"))
            self.optionsDescription = "The size of a guest bedroom. Use ours if you don’t have your own!"
            self.optionsPriceStr = "$184/month"
            self.optionsSize = "520 cubic feet of usable space."
            self.id = "5bfbdf834d47cf26dab536fd"
            self.pricingDescription = "Unit Dimensions 10' x 10' (100 sq.ft) \n Each Unit is $"
        default:
            self.name = orderType
            self.optionsImage = UIImage(named: ("Options-6"))
            self.optionsDescription = "If you have more than just one bedroom, this will be plenty to help you out."
            self.optionsPriceStr = "$260/month"
            self.optionsSize = "780 cubic feet of usable space."
            self.id = "5bfbe02d4d47cf26dab536fe"
            self.pricingDescription = "Unit Dimensions 10' x 15' (150 sq.ft) \n Each Unit is $"
        }
        
    }
    
    func getOrderTypeInfo(completion: @escaping () -> Void) {
        if self.pricingRetrieved == false {
            //Web service Request
            let parameters = [
                "id": self.id ?? "0"
            ]
            let header: HTTPHeaders = ["Accept": "application/json"]
            CustomAlamoManager.Manager.request("https://api.valet.storage/requests/ordertype", method: .post, parameters: parameters, encoding: JSONEncoding(options: []),headers :header).responseJSON { response in
                if response.result.isSuccess {
                    let data = response.result.value as? [String: Any]
                    if (data!["_id"] as? String) != nil {
                        self.price = data!["price"] as! Float
                        self.pricingDescription = self.pricingDescription + String(self.price) + "/month. Initial delivery and pick-up of bins is FREE. Additional deliveries, pick-ups and re-deliveries are $17 each."
                        self.pricingRetrieved = true
                        completion()
                    } else {
                        self.price = 0
                        completion()
                    }
                    
                } else {
                    completion()
                }
            }
        } else {
            completion()
        }
        
    }
}
