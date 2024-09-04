//
//  ListModel.swift
//  Architecture
//
//  Created by Saud Syed on 26/04/2024.
//

import Foundation

struct ListModel : Codable {
    let page : Int?
    let per_page : Int?
    let total : Int?
    let total_pages : Int?
    let data : [ListModelData]?
    let support : ListModelSupportData?
}

struct ListModelData : Codable {
    let id : Int?
    let email : String?
    let first_name : String?
    let last_name : String?
    let avatar : String?
}

struct ListModelSupportData : Codable {
    let url : String?
    let text : String?
}
