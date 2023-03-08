//
//  ViewController.swift
//  ListPostsTableVProgCombine
//
//  Created by Marco Alonso Rodriguez on 08/03/23.
//

import UIKit

struct Product {
    let name: String
    let image: UIImage
}

class ViewController: UIViewController {

    let tableView = UITableView()
    
    var products = [
        Product(name: "Product One", image: UIImage(named: "1")!),
        Product(name: "Product Two", image: UIImage(named: "2")!),
        Product(name: "Product three", image: UIImage(named: "3")!),
        Product(name: "Product four", image: UIImage(named: "4")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else {
            fatalError("Error creating custom cell")
        }
        cell.configure(with: products[indexPath.row].image, and: products[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
