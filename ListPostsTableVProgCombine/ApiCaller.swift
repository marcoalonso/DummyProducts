//
//  ApiCaller.swift
//  ListPostsTableVProgCombine
//
//  Created by Marco Alonso Rodriguez on 08/03/23.
//

import Foundation

public class APICaller {
    public static let shared = APICaller()
    
    init() {}
    
    func fetchProducts(completion: @escaping ([Product]?) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            completion(nil)
            print("Debug: error making url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                print("Debug: error on the server")
                return
            }
            //Decode
            do {
                let results = try JSONDecoder().decode(ProductsResponse.self, from: data)
                print(results)
                completion(results.products)
            } catch {
                completion(nil)
                print("Debug: error decoding data \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
