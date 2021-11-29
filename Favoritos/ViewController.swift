//
//  ViewController.swift
//  Favoritos
//
//  Created by soporte on 29/11/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    private lazy var tittleLabel = UILabel()
    private lazy var subtittleLabel = UILabel()
    private lazy var plusBtn = UIButton()
    
    lazy var topView: ColeccionesView = {
        let tv = ColeccionesView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var favoritos: [Favorito] = []
    
    override func viewDidLoad() {
        
//            AF.request("https://gist.githubusercontent.com/aletomm90/7ff8e9a7c49aefd06a154fe097028d27/raw/c87e2e7d21313391d412420b4254c391aa68eeec/favorites.json")
//              .validate()
//              .responseDecodable(of: Favorito.self) { (response) in
//                  guard let [fav] = response.value else { return }
//                  self.favoritos = fav
//                  subtittleLabel.text = favoritos
//              }

        
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        view.addSubview(tittleLabel)
        view.addSubview(subtittleLabel)
        view.addSubview(plusBtn)
        view.addSubview(topView)
        
        tittleLabel.font = .systemFont(ofSize: 22)
        tittleLabel.text = "Favoritos"
        tittleLabel.clipsToBounds = true
        tittleLabel.textColor = UIColor(named: "Blackie")
        subtittleLabel.font = .systemFont(ofSize: 14)
        subtittleLabel.text = "Todos mis favoritos (16)"
        subtittleLabel.textColor = UIColor(named: "Blackie")
        plusBtn.setImage(UIImage(named: "PlusIcon"), for: .normal)
        plusBtn.tintColor = UIColor(named: "PinkishGrey")
        plusBtn.clipsToBounds = true
        
        tittleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtittleLabel.translatesAutoresizingMaskIntoConstraints = false
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tittleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tittleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20.0),
            
            plusBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 17.0),
            plusBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 17.0),
            plusBtn.widthAnchor.constraint(equalToConstant: 23.0),
            plusBtn.heightAnchor.constraint(equalToConstant: 23.0),
            
            topView.topAnchor.constraint(equalTo: tittleLabel.bottomAnchor,constant: 11.0),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 204.0),
            
            subtittleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtittleLabel.topAnchor.constraint(equalTo: topView.bottomAnchor,constant: 36.0),
            
        ])
    }
}

