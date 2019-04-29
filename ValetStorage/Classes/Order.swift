//
//  Order.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/26/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import Foundation

// Object to store data as a user navigates the checkout process
class Order {
    var orderType: OrderType!
    var boxQuantity: Int!
    var initialCost: Float!
    var monthlyCost: Float!
    var tax: Float!
    var monthlyCostTotal: Float!
    var deliveryZipCode: Int!
    var deliveryAddress1: String!
    var dilveryAddress2: String!
    var deliveryCity: String!
    var pickupZipCode: Int!
    var pickupAddress1: String!
    var pickupAddress2: String!
    var pickupCity: String!
    var pickupDate: Date!
    var deliveryInstructions: String!
    var pickupInstructions: String!
    var deliveryDate: Date!
    var deliveryTime: String!
    var deliveryState: String!
    var deliveryDisplayTracker: Int!
    var pickupTime: String!
    var pickupState: String!

}
