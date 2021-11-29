//
//  ColeccionesViewCell.swift
//  Favoritos
//
//  Created by soporte on 29/11/21.
//

import Foundation
import UIKit

class ColeccionesViewCell: UICollectionViewCell {
    
    private lazy var imagen1 = UIImageView()
    private lazy var imagen2 = UIImageView()
    private lazy var imagen3 = UIImageView()
    private lazy var textLabel = UILabel()
    private lazy var countLabel = UILabel()
    
    static let cellId = "ColeccionesCell"
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    let bkgdView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    let bkgdView2: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8.0
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    
}

private extension ColeccionesViewCell {
    
    private func setupUI() {
        backgroundColor = .clear
        
        self.addSubview(bkgdView)
        self.addSubview(bkgdView2)
        self.addSubview(imagen1)
        self.addSubview(imagen2)
        self.addSubview(imagen3)
        self.addSubview(textLabel)
        self.addSubview(countLabel)
        
        
        imagen1.translatesAutoresizingMaskIntoConstraints = false
        imagen2.translatesAutoresizingMaskIntoConstraints = false
        imagen3.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        bkgdView.translatesAutoresizingMaskIntoConstraints = false
        bkgdView2.translatesAutoresizingMaskIntoConstraints = false
        
        imagen1.clipsToBounds = true
        imagen1.layer.cornerRadius = 12
        imagen1.contentMode = .scaleAspectFill
        imagen2.layer.cornerRadius = 12
        imagen2.contentMode = .scaleAspectFill
        imagen3.layer.cornerRadius = 12
        imagen3.contentMode = .scaleAspectFill
        textLabel.textColor = UIColor(named: "Blackie")
        textLabel.textAlignment = .left
        textLabel.font = .systemFont(ofSize: 14)
        countLabel.textColor = UIColor(named: "PinkishGrey")
        countLabel.textAlignment = .left
        countLabel.font = .systemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            
            self.topAnchor.constraint(equalTo: self.topAnchor,constant: 10.0),
            self.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10.0),
            
            bkgdView.topAnchor.constraint(equalTo: self.topAnchor),
            bkgdView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bkgdView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bkgdView.widthAnchor.constraint(equalToConstant: 174.0),
            bkgdView.heightAnchor.constraint(equalToConstant: 178.0),
            
            bkgdView2.topAnchor.constraint(equalTo: bkgdView.topAnchor),
            bkgdView2.leadingAnchor.constraint(equalTo: bkgdView.leadingAnchor),
            bkgdView2.trailingAnchor.constraint(equalTo: bkgdView.trailingAnchor),
            bkgdView.heightAnchor.constraint(equalToConstant: 120.0),
            
            imagen1.topAnchor.constraint(equalTo: bkgdView2.topAnchor,constant: 10.0),
            imagen1.leadingAnchor.constraint(equalTo: bkgdView2.leadingAnchor,constant: 10.0),
            imagen1.bottomAnchor.constraint(equalTo: bkgdView2.bottomAnchor,constant: -10.0),
            imagen1.widthAnchor.constraint(equalToConstant: 100.0),
            
            imagen2.topAnchor.constraint(equalTo: bkgdView2.topAnchor,constant: 10.0),
            imagen2.leadingAnchor.constraint(equalTo: imagen1.leadingAnchor,constant: 8.0),
            imagen2.trailingAnchor.constraint(equalTo: bkgdView2.trailingAnchor,constant: -10.0),
            imagen2.heightAnchor.constraint(equalToConstant: 46.0),
            
            imagen3.topAnchor.constraint(equalTo: imagen2.bottomAnchor,constant: 8.0),
            imagen3.leadingAnchor.constraint(equalTo: imagen1.leadingAnchor,constant: 8.0),
            imagen3.trailingAnchor.constraint(equalTo: bkgdView2.trailingAnchor,constant: -10.0),
            imagen3.bottomAnchor.constraint(equalTo: bkgdView2.bottomAnchor,constant: -10.0),
            
            textLabel.leadingAnchor.constraint(equalTo: bkgdView.leadingAnchor,constant: 8.0),
            textLabel.trailingAnchor.constraint(equalTo: bkgdView.trailingAnchor,constant: -63.0),
            textLabel.topAnchor.constraint(equalTo: bkgdView2.bottomAnchor,constant: 12.0),
            
            countLabel.leadingAnchor.constraint(equalTo: bkgdView.leadingAnchor,constant: 8.0),
            countLabel.bottomAnchor.constraint(equalTo: bkgdView.bottomAnchor,constant: -8.0)
        ])
    }
}

extension ColeccionesViewCell {
    
    public func configure(products: [String: Product], name: String, count: Int) {
        
        let url1 = URL(string: "https://i.linio.com/p/c97a50b1c6c7e3bb2c48c1b4104d5975-product.jpg")
        let data1 = try? Data(contentsOf: url1!)
        imagen1.image = UIImage(data: data1!)
        let url2 = URL(string: "https://i.linio.com/p/f1a6240aad2fca51f065da7a39f4f37d-product.jpg")
        let data2 = try? Data(contentsOf: url2!)
        imagen2.image = UIImage(data: data2!)
        let url3 = URL(string: "https://i.linio.com/p/8c59451780d21c17cc4ec3c6de0df79c-product.jpg")
        let data3 = try? Data(contentsOf: url3!)
        imagen3.image = UIImage(data: data3!)
        
        textLabel.text = name
        countLabel.text = String(count)
    }
}
