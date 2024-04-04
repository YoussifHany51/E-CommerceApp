//
//  Product.swift
//  E-CommerceApp
//
//  Created by Youssif Hany on 04/04/2024.
//

import Foundation


struct Product:Identifiable,Codable{
    let id : Int
    let title : String
    let price : Int
    let description : String
    let images : [String]
    let creationAt : String
    var updatedAt : String
    let category : Category
}
