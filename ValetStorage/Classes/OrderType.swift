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
    var price: Float!
    var id: String!
    
    var optionsImageStr: String!
    var optionsDescription: String!
    var optionsPriceStr: String!
    var optionsSize: String!
    
    init(orderType: String!) {
        switch orderType {
        case "Bins":
            self.name = orderType
            self.optionsImageStr = "Options-1"
            self.optionsDescription = "Perfect for unloading a few bins of winter clothes or childhood memorabilia."
            self.optionsPriceStr = "$6/month"
            self.optionsSize = "Bins are 17″ x 27″ x 12″"
            self.id = "5b5837ba4da6f3c0e03134bf"
        case "5' X 5' Unit":
            self.name = orderType
            self.optionsImageStr = "Options-2"
            self.optionsDescription = "Free up your garage, or store baby gear until you need it again."
            self.optionsPriceStr = "$66/month"
            self.optionsSize = "130 cubic feet of usable space."
            self.id = "5b58384c4da6f3c0e03134d4"
        case "5' X 10' Unit":
            self.name = orderType
            self.optionsImageStr = "Options-3"
            self.optionsDescription = "Large walk-in closet. Anything you can fit there, fits here!"
            self.optionsPriceStr = "$85/month"
            self.optionsSize = "260 cubic feet of usable space."
            self.id = "5b58389e4da6f3c0e03134da"
        case "10' X 10' Unit":
            self.name = orderType
            self.optionsImageStr = "Options-4"
            self.optionsDescription = "Universal size that will fit almost anyone’s needs.  Perfect closet size."
            self.optionsPriceStr = "$123/month"
            self.optionsSize = "390 cubic feet of usable space."
            self.id = "5b60439987280c518c974b38"
        case "7.5' X 10' Unit":
            self.name = orderType
            self.optionsImageStr = "Options-5"
            self.optionsDescription = "The size of a guest bedroom. Use ours if you don’t have your own!"
            self.optionsPriceStr = "$184/month"
            self.optionsSize = "520 cubic feet of usable space."
            self.id = "5bfbdf834d47cf26dab536fd"
        default:
            self.name = orderType
            self.optionsImageStr = "Options-6"
            self.optionsDescription = "If you have more than just one bedroom, this will be plenty to help you out."
            self.optionsPriceStr = "$260/month"
            self.optionsSize = "780 cubic feet of usable space."
            self.id = "5bfbe02d4d47cf26dab536fe"
        }
    }
    
    static func getOrderTypeInfo(orderType: OrderType) {
        
        //Web service Request
        let parameters = [
            "id": orderType.id ?? "0"
        ]
        let header: HTTPHeaders = ["Accept": "application/json"]
        CustomAlamoManager.Manager.request("https://api.valet.storage/requests/ordertype", method: .post, parameters: parameters, encoding: JSONEncoding(options: []),headers :header).responseJSON { response in
            if response.result.isSuccess {
                let data = response.result.value as? [String: Any]
                if (data!["_id"] as? String) != nil {
                    orderType.price = data!["price"] as! Float
                } else {
                    // error
                }
                
            } else {
            }
        }
    }
}
