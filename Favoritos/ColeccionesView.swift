//
//  ColeccionesViewController.swift
//  Favoritos
//
//  Created by soporte on 29/11/21.
//

import Foundation
import UIKit

class ColeccionesView: UIViewController, UICollectionViewDelegate {
    
    
    // MARK: - Subviews
    private lazy var carouselCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.showsHorizontalScrollIndicator = false
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        return collection
    }()
    
    
    // MARK: - Properties
    private var carouselData = [Favorito]()
    private var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "https://gist.githubusercontent.com/aletomm90/7ff8e9a7c49aefd06a154fe097028d27/raw/c87e2e7d21313391d412420b4254c391aa68eeec/favorites.json").responseJSON { (request, response, json, error) in
            
            if json != nil {
                var jsonObj = JSON(json!)
                if let data = jsonObj[""].arrayValue as [JSON]?{
                    self.favorites = data
                    self.collectionView.reloadData()
                }
            }
            
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ColeccionesView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColeccionesViewCell.cellId, for: indexPath) as? ColeccionesViewCell else { return UICollectionViewCell() }
        
        let products = carouselData[indexPath.row].products
        let coleccion = carouselData[indexPath.row].name
        let count = carouselData[indexPath.row].products.count
        
        cell.configure(products: products, name: coleccion, count: count)
        
        return cell
    }
}

extension ColeccionesView {
    public func configureView(with data: [Favorito]) {
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
        carouselLayout.itemSize = .init(width: 300, height: 400)
        carouselLayout.sectionInset = .zero
        carouselCollectionView.collectionViewLayout = carouselLayout
        
        carouselData = data
        carouselCollectionView.reloadData()
    }
}
