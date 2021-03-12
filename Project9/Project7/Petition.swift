//
//  Petition.swift
//  Project7
//
//  Created by Alexander Filippov on 4.3.21..
//  Copyright © 2021 Alexander Filippov. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
