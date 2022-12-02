//
//  HomeDataModel.swift
//  ShoppingApp
//
//  Created by mac on 02/12/22.
//

import Foundation
struct HomeDataModel : Codable {
    let type : String?
    let value : [ValuesModel]?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case value = "values"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        value = try values.decodeIfPresent([ValuesModel].self, forKey: .value)
    }

}
