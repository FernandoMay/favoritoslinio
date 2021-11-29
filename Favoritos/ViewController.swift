//
//  ViewController.swift
//  Favoritos
//
//  Created by soporte on 29/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var tittleLabel = UILabel()
    private lazy var subtittleLabel = UILabel()
    private lazy var plusBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        // Do any additional setup after loading the view.
    }

    private func setupUI(){
        view.addSubview(tittleLabel)
        view.addSubview(subtittleLabel)
        view.addSubview(plusBtn)
        
        NSLayoutConstraint.activate([
            
        ])
    }
}

