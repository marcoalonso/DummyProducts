//
//  ViewController.swift
//  ListPostsTableVProgCombine
//
//  Created by Marco Alonso Rodriguez on 08/03/23.
//

import UIKit
import Combine
import Kingfisher


class ViewController: UIViewController {

    let tableView = UITableView()
    
    var viewModel = ProductVieModel()
    var anyCancellable : [AnyCancellable] = []
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        subscriptions()
        viewModel.getProducts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
  
    func subscriptions(){
        viewModel.listOfProducts.sink { completion in
            switch completion {
            case .failure(let error):
                switch error {
                case ProductError.errorEnServidor:
                    DispatchQueue.main.async {
                        self.mostrarAlerta(titulo: "ATENCIÓN", mensaje: "Ocurrió un error en el servidor, favor de intentar mas tarde.")
                    }
                case ProductError.badRequest:
                    DispatchQueue.main.async {
                        self.mostrarAlerta(titulo: "ATENCIÓN", mensaje: "Ocurrió un error en el servidor, favor de intentar mas tarde.")
                    }
                default:
                    self.mostrarAlerta(titulo: "ATENCIÓN", mensaje: "Ocurrió un error desconocido.")
                }
                
            case .finished:
                print("Finalizado")
            }
            
        } receiveValue: { [weak self] listProducts in
            self?.products = listProducts
            self?.tableView.reloadData()
        }.store(in: &anyCancellable)

    }

    func mostrarAlerta(titulo: String, mensaje: String) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let accionAceptar = UIAlertAction(title: "OK", style: .default) { _ in
            //Do something
        }
        alerta.addAction(accionAceptar)
        present(alerta, animated: true)
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
        
        cell.configure(urlImage: products[indexPath.row].thumbnail, and: products[indexPath.row].title, "\(products[indexPath.row].price)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
