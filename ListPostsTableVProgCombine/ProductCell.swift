//
//  ProductCell.swift
//  ListPostsTableVProgCombine
//
//  Created by Marco Alonso Rodriguez on 08/03/23.
//

import Foundation
import UIKit
import Kingfisher
 
class ProductCell: UITableViewCell {
    static let identifier = "ProductCell"
    
    private let imageProduct: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(systemName: "person")
        iv.tintColor = .label
        return iv
    }()
    
    private let nameLabel : UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.text = "Hello"
        return label
    }()
    
    private let priceLabel : UILabel = {
       let label = UILabel()
        label.textColor = .red
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "$15.4"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented!")
    }
    
    public func configure(urlImage imageUrl: String , and label: String, _ price: String){
        let url = URL(string: imageUrl)
        imageProduct.kf.setImage(with: url)
        
        self.nameLabel.text = label
        self.priceLabel.text = price
    }
    
    private func setupUI(){
        self.contentView.addSubview(imageProduct)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(priceLabel)
        
        imageProduct.layer.cornerRadius = 10
        imageProduct.layer.masksToBounds = true
        
        imageProduct.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            imageProduct.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            imageProduct.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            imageProduct.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            imageProduct.heightAnchor.constraint(equalToConstant: 50),
            imageProduct.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.leadingAnchor.constraint(equalTo: self.imageProduct.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            priceLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            
        ])
    }
}
