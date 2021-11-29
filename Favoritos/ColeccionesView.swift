//
//  ColeccionesViewController.swift
//  Favoritos
//
//  Created by soporte on 29/11/21.
//

import Foundation
import UIKit
import Alamofire

class ColeccionesView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var items: [Favorito] = []
    
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
        fetchData()
        self.backgroundColor = .clear
        
        addSubview(collectionView)
        
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    struct Favoritos: Decodable {
      let count: Int
      let all: [Favorito]
      
      enum CodingKeys: String, CodingKey {
        case count
        case all = "results"
      }
    }
    
    func fetchData(){
        //        AF.request("https://gist.githubusercontent.com/aletomm90/7ff8e9a7c49aefd06a154fe097028d27/raw/c87e2e7d21313391d412420b4254c391aa68eeec/favorites.json").response { response in
        //            self.items = response.value
        //
        //        }
        AF.request("https://gist.githubusercontent.com/aletomm90/7ff8e9a7c49aefd06a154fe097028d27/raw/c87e2e7d21313391d412420b4254c391aa68eeec/favorites.json").validate()
            .responseDecodable(of: Favoritos.self) { (response) in
              guard let favoritos = response.value else { return }
                
                self.items = favoritos.all
                self.collectionView.reloadData()

            }

//        AF.request("https://gist.githubusercontent.com/aletomm90/7ff8e9a7c49aefd06a154fe097028d27/raw/c87e2e7d21313391d412420b4254c391aa68eeec/favorites.json")
//            .validate()
//            .responseDecodable(of: Favorito.self) { (response) in
//                guard let fav = response.value else { return }
//                debugPrint(fav)
//                self.items.append(fav)
//                self.collectionView.reloadData()
//            }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColeccionesCell", for: indexPath) as! ColeccionesViewCell
        
        
        cell.configure(products: items[indexPath.row].products, name: items[indexPath.row].name, count: items[indexPath.row].products.count)
        return cell
    }
    
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return CGSize(width: self.collectionView.frame.size.width, height: 200)
//        }
}



//extension ColeccionesView {
//    public func configureView(with data: [Favorito]) {
//        let carouselLayout = UICollectionViewFlowLayout()
//        carouselLayout.scrollDirection = .horizontal
//        carouselLayout.itemSize = .init(width: 300, height: 400)
//        carouselLayout.sectionInset = .zero
//        carouselCollectionView.collectionViewLayout = carouselLayout
//
//        carouselData = data
//        carouselCollectionView.reloadData()
//    }
//}
