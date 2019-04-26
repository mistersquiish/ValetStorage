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
    var imageStr: String!
    var description: String!
    var price: String!
    var size: String!
    var id: String!
    
    init(orderType: String!) {
        switch orderType {
        case "Bins":
            self.name = orderType
            self.imageStr = "Options-1"
            self.description = "Perfect for unloading a few bins of winter clothes or childhood memorabilia."
            self.price = "$6/month"
            self.size = "Bins are 17″ x 27″ x 12″"
            self.id = "5b5837ba4da6f3c0e03134bf"
        case "5' X 5' Unit":
            self.name = orderType
            self.imageStr = "Options-2"
            self.description = "Free up your garage, or store baby gear until you need it again."
            self.price = "$66/month"
            self.size = "130 cubic feet of usable space."
            self.id = "5b58384c4da6f3c0e03134d4"
        case "5' X 10' Unit":
            self.name = orderType
            self.imageStr = "Options-3"
            self.description = "Large walk-in closet. Anything you can fit there, fits here!"
            self.price = "$85/month"
            self.size = "260 cubic feet of usable space."
            self.id = "5b58389e4da6f3c0e03134da"
        case "10' X 10' Unit":
            self.name = orderType
            self.imageStr = "Options-4"
            self.description = "Universal size that will fit almost anyone’s needs.  Perfect closet size."
            self.price = "$123/month"
            self.size = "390 cubic feet of usable space."
            self.id = "5b60439987280c518c974b38"
        case "7.5' X 10' Unit":
            self.name = orderType
            self.imageStr = "Options-5"
            self.description = "The size of a guest bedroom. Use ours if you don’t have your own!"
            self.price = "$184/month"
            self.size = "520 cubic feet of usable space."
            self.id = "5bfbdf834d47cf26dab536fd"
        default:
            self.name = orderType
            self.imageStr = "Options-6"
            self.description = "If you have more than just one bedroom, this will be plenty to help you out."
            self.price = "$260/month"
            self.size = "780 cubic feet of usable space."
            self.id = "5bfbe02d4d47cf26dab536fe"
        }
    }
    
    static func getOrderTypeInfo(orderType: OrderType) {
        CustomAlamoManager.handleAuthChallenge()
        
        //Web service Request
        let parameters = [
            "id": orderType.id ?? "0"
        ]
        let header: HTTPHeaders = ["Accept": "application/json"]
        CustomAlamoManager.Manager.request("https://api.valet.storage/requests/ordertype", method: .post, parameters: parameters, encoding: JSONEncoding(options: []),headers :header).responseJSON { response in
            if response.result.isSuccess {
                let data = response.result.value as? [String: Any]
                if (data!["_id"] as? String) != nil {
                    print("asdf")
                } else {
                    print("asdf3")
                }
                
            } else {
            }
        }
    }
}
