//
//  FavoritosViewController.swift
//  Favoritos
//
//  Created by soporte on 29/11/21.
//

import Foundation
import UIKit

class FavoritosView: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FavoritoCell", forIndexPath: indexPath) as FavoritoViewCell
        
        cell.favorito = self.favorites[indexPath.row]
        return cell
    }
    
    var favorites: [Favorito] = []
    private var collectionView: UICollectionView!

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return favorites.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("UserCell", forIndexPath: indexPath) as FavoritoViewCell

        cell.favorito = self.favorites[indexPath.row]
        return cell
    }

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
