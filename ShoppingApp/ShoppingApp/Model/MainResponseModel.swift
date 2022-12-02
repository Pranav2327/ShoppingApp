//
//  MainResponseModel.swift
//  ShoppingApp
//
//  Created by mac on 02/12/22.
//

import Foundation
struct MainResponseModel : Codable {
    let status : Bool?
    let homeData : [HomeDataModel]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case homeData = "homeData"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        homeData = try values.decodeIfPresent([HomeDataModel].self, forKey: .homeData)
    }

}
