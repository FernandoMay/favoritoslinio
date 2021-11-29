//
//  FavoritosViewController.swift
//  Favoritos
//
//  Created by soporte on 29/11/21.
//

import Foundation
import UIKit

class FavoritosView : UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        //If you set it false, you have to add constraints.
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(ColeccionesViewCell.self, forCellWithReuseIdentifier: "ColeccionesCell")
        cv.backgroundColor = .clear
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        
        addSubview(collectionView)
        
        //Add constraint
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColeccionesCell", for: indexPath) as! ColeccionesViewCell
//
//        let products = carouselData[indexPath.row].products.values
//        let coleccion = carouselData[indexPath.row].name
//        let count = carouselData[indexPath.row].products.count
//
//        cell.configure(products: products as! [Product], name: coleccion, count: count)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width, height: 200)
    }
}

//class FavoritosView: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritoCell", fordequeueReusableCellwithReuseIdentifier: for: indexPath) as! FavoritoViewCell
//
//        cell.favorito = self.favorites[indexPath.row]
//        return cell
//    }
//
//    var favorites: [Favorito] = []
//    private var collectionView: UICollectionView!
//
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        //#warning Incomplete method implementation -- Return the number of items in the section
//        return favorites.count
//    }
//
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("UserCell", forIndexPath: indexPath) as FavoritoViewCell
//
//        cell.favorito = self.favorites[indexPath.row]
//        return cell
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        Alamofire.request(.GET, "https://gist.githubusercontent.com/aletomm90/7ff8e9a7c49aefd06a154fe097028d27/raw/c87e2e7d21313391d412420b4254c391aa68eeec/favorites.json").responseJSON { (request, response, json, error) in
//
//            if json != nil {
//                var jsonObj = JSON(json!)
//                if let data = jsonObj[""].arrayValue as [JSON]?{
//                    self.favorites = data
//                    self.collectionView.reloadData()
//                }
//            }
//
//        }
//    }
//}
