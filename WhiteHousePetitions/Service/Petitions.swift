//
//  Petitions.swift
//  WhiteHousePetitions
//
//  Created by Bruna Fernanda Drago on 26/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import Foundation

struct Petitions :Decodable {
    var results : [Petition]
}


struct Petition :Decodable {
    
    var title:String
    var body:String
    var signatureCount:Int
}
