//
//  FavoritoViewCell.swift
//  Favoritos
//
//  Created by soporte on 29/11/21.
//

import Foundation
import UIKit

class FavoritoViewCell: UICollectionViewCell {

    private lazy var images: [UIImageView] = []
    private lazy var textLabel = UILabel()
    private lazy var count = UILabel()

    static let cellId = "FavoritoCell"
        
        // MARK: - Initializer
        
        override init(frame: CGRect) {
            super.init(frame: frame)
//            setupUI()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
//            setupUI()
        }
    
    
    
}

//private extension FavoritoCollectionViewCell {
//    func setupUI() {
//        backgroundColor = .clear
//
//        addSubview(images[0])
//        images.translatesAutoresizingMaskIntoConstraints = false
//        images[0].topAnchor.constraint(equalTo: topAnchor).isActive = true
//        images[0].widthAnchor.constraint(equalTo: widthAnchor).isActive = true
//        images[0].centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        images[0].heightAnchor.constraint(equalToConstant: 300).isActive = true
//        images[0].contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 24
//
//        addSubview(textLabel)
//        textLabel.translatesAutoresizingMaskIntoConstraints = false
//        textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
//        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
//        textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
//        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
//        textLabel.numberOfLines = 0
//        textLabel.textAlignment = .center
//        textLabel.font = .systemFont(ofSize: 18)
//        textLabel.textColor = .white
//    }
//}
//
//// MARK: - Public
//extension FavoritoCell {
//    public func configure(image: UIImage?, text: String) {
//        imageView.image = image
//        textLabel.text = text
//    }
//}
