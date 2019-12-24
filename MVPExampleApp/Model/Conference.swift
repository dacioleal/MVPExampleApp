//
//  Conference.swift
//  MVPExampleApp
//
//  Created by Dacio Leal Rodriguez on 24/12/2019.
//  Copyright © 2019 Dacio Leal Rodriguez. All rights reserved.
//

import Foundation

struct Conference: Codable {
    
    var abbreviation: String
    var id: Int
    var name: String
    var shortName: String
    
    private enum CodingKeys: String, CodingKey {
        case abbreviation
        case id
        case name
        case shortName = "short_name"
    }
}
