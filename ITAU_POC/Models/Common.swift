//
//  Common.swift
//  ITAU_POC
//
//  Created by Parag on 27/11/19.
//  Copyright © 2019 Parag. All rights reserved.
//

import Foundation

struct ErrorModel: Codable {
    let code: Int
    let errorMessage: String
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = (try container.decodeIfPresent(Int.self, forKey: .code)) ?? -1
        errorMessage = (try container.decodeIfPresent(String.self, forKey: .errorMessage)) ?? "NA"
    }
    init(code: Int, message: String) {
        self.code = code
        self.errorMessage = message
    }
}
