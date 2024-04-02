//
//  Category.swift
//  E-CommerceApp
//
//  Created by Youssif Hany on 02/04/2024.
//

import Foundation


struct Category:Identifiable,Codable{
    let id: Int
    let name : String
    let image: String
    let creationAt: String
    var updatedAt: String
}
