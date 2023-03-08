//
//  ProductVieModel.swift
//  ListPostsTableVProgCombine
//
//  Created by Marco Alonso Rodriguez on 08/03/23.
//

import Foundation
import Combine

enum ProductError: Error {
    case badRequest
    case errorEnServidor
}

class ProductVieModel {
    var listOfProducts = PassthroughSubject<[Product], Error>()
    
    let apicaller = APICaller.shared
    
    func getProducts() {
        apicaller.fetchProducts { [weak self] listProducts in
            if let listProducts = listProducts {
                DispatchQueue.main.async {
                    self?.listOfProducts.send(listProducts)
                }
            } else {
                self?.listOfProducts.send(completion: .failure(ProductError.errorEnServidor))
            }
            
        }
    }
}
