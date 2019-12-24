//
//  Team.swift
//  MVPExampleApp
//
//  Created by Dacio Leal Rodriguez on 24/12/2019.
//  Copyright © 2019 Dacio Leal Rodriguez. All rights reserved.
//

import Foundation

struct Team: Codable {
    
    var id: Int
    var school: String
    var mascot: String
    var abbreviation: String
    var altName1: String?
    var altName2: String?
    var altName3: String?
    var conference: String
    var division: String
    var color: String?
    var altColor: String?
    var logos: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case school
        case mascot
        case abbreviation
        case altName1 = "alt_name1"
        case altName2 = "alt_name2"
        case altName3 = "alt_name3"
        case conference
        case division
        case color
        case altColor = "alt_color"
        case logos
    }
}
