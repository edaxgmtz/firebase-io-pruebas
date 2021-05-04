//
//  HomeController.swift
//  FirebaseLoginEd
//
//  Created by Miguel Ledezma on 09/10/20.
//  Copyright © 2020 Miguel Ledezma. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeController: UIViewController {
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bienvenido"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let emailTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.placeholder = ("Email")
        
        return text
    }()
    
    let passwordTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.placeholder = ("Contraseña")

        return text
    }()
    
    let lineBottonH: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        return label
    }()
    
    let viewPockemonsBtn : UIButton = {
           let btn = UIButton()
           btn.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
           btn.translatesAutoresizingMaskIntoConstraints = false
           btn.layer.cornerRadius = 10
           btn.setImage(UIImage(systemName: "arrow.right"), for: .normal)
           btn.imageEdgeInsets.left = -100
           btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
           btn.setTitle("Ver", for: .normal)
           //btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
           btn.tintColor = .white
           return btn
       }()
    
    let addPockemonsBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        btn.imageEdgeInsets.left = -100
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitle("Add", for: .normal)
        //btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        btn.tintColor = .white
        return btn
    }()
    
    
       let crudBtn : UIButton = {
           let btn = UIButton()
           btn.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
           btn.translatesAutoresizingMaskIntoConstraints = false
           btn.layer.cornerRadius = 10
           btn.setImage(UIImage(systemName: "arrow.right"), for: .normal)
           btn.imageEdgeInsets.left = -100
           btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
           btn.setTitle("CRUD", for: .normal)
           //btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
           btn.tintColor = .white
           return btn
       }()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        view.addSubview(titleLabel)
        view.addSubview(viewPockemonsBtn)
        view.addSubview(addPockemonsBtn)
        view.addSubview(crudBtn)
              
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            titleLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            
            viewPockemonsBtn.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20),
            viewPockemonsBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            viewPockemonsBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            viewPockemonsBtn.heightAnchor.constraint(equalToConstant: view.frame.height / 12),
            
            addPockemonsBtn.topAnchor.constraint(equalTo: viewPockemonsBtn.bottomAnchor,constant: 20),
            addPockemonsBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            addPockemonsBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            addPockemonsBtn.heightAnchor.constraint(equalToConstant: view.frame.height / 12),
            
            crudBtn.topAnchor.constraint(equalTo: addPockemonsBtn.bottomAnchor,constant: 20),
            crudBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            crudBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            crudBtn.heightAnchor.constraint(equalToConstant: view.frame.height / 12),
        
        
        ])
        
         viewPockemonsBtn.addTarget(self, action: #selector(RegosterUser), for: .touchUpInside)
        addPockemonsBtn.addTarget(self, action: #selector(addpockemon), for: .touchUpInside)
        crudBtn.addTarget(self, action: #selector(viewCrud), for: .touchUpInside)
    }
    
    @objc func RegosterUser() {
        let controller = ViewPocjemonsController(collectionViewLayout: UICollectionViewFlowLayout())      
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func viewCrud() {
        let controller = ViewDatesPostGetDelete()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func addpockemon() {
           let controller = AddPockemonControoler()
           navigationController?.pushViewController(controller, animated: true)
       }
  
}
