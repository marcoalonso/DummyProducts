//
//  Product.swift
//  ListPostsTableVProgCombine
//
//  Created by Marco Alonso Rodriguez on 08/03/23.
//

import Foundation

struct ProductsResponse: Codable {
    let products: [Product]
}

struct Product: Codable {
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let brand: String
    let category: String
    let thumbnail: String
}
