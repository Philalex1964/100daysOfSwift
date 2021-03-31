//
//  Person.swift
//  Project10
//
//  Created by Alexander Filippov on 20.3.21..
//  Copyright © 2021 Alexander Filippov. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
