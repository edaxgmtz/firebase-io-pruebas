//
//  ViewDatesPostGetDelete.swift
//  FirebaseLoginEd
//
//  Created by Miguel Ledezma on 13/10/20.
//  Copyright © 2020 Miguel Ledezma. All rights reserved.
//

import UIKit

class ViewDatesPostGetDelete: UIViewController {

var nameLabel: UILabel = {
   let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.textColor = .white
    label.textAlignment = .center
    label.backgroundColor = .black
    return label
}()
var emailLabel: UILabel = {
   let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "namePockemon"
    label.textColor = .white
    label.textAlignment = .center
    label.backgroundColor = .black
    return label
}()
var idLabel: UILabel = {
   let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "namePockemon"
    label.textColor = .white
    label.textAlignment = .center
    label.backgroundColor = .black
    return label
}()
    let getBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitle("GET", for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    let postBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitle("POST", for: .normal)
        btn.tintColor = .white
        return btn
    }()

    
    let deleteBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitle("DELETE", for: .normal)
        btn.tintColor = .white
        return btn
    }()


    var activityIndicator: UIActivityIndicatorView = {
        let btn = UIActivityIndicatorView()
        btn.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.tintColor = .white
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        nameLabel.text = ""
        nameLabel.numberOfLines = 0
        emailLabel.text = ""
        emailLabel.numberOfLines = 0
        idLabel.text = ""

        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(idLabel)
        view.addSubview(getBtn)
        view.addSubview(postBtn)
        view.addSubview(deleteBtn)
        
        
        NSLayoutConstraint.activate([
                   
                   
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
        nameLabel.heightAnchor.constraint(equalToConstant: 50),
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 30),
        emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
        emailLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        emailLabel.heightAnchor.constraint(equalToConstant: 50),
         
        idLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 30),
        idLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
        idLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        idLabel.heightAnchor.constraint(equalToConstant: 50),
        
        getBtn.topAnchor.constraint(equalTo: idLabel.bottomAnchor,constant: 30),
        getBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
        getBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        getBtn.heightAnchor.constraint(equalToConstant: 50),
        
        postBtn.topAnchor.constraint(equalTo: getBtn.bottomAnchor),
        postBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
        postBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        postBtn.heightAnchor.constraint(equalToConstant: 50),
        
        deleteBtn.topAnchor.constraint(equalTo: postBtn.bottomAnchor),
        deleteBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
        deleteBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        deleteBtn.heightAnchor.constraint(equalToConstant: 50),
        
        //activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       // activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        activityIndicator.widthAnchor.constraint(equalToConstant: 50),
        activityIndicator.heightAnchor.constraint(equalToConstant: 50),
       ])
        
        
        
        getBtn.addTarget(self, action: #selector(getUserAction(_:)), for: .touchUpInside)
        postBtn.addTarget(self, action: #selector(addUserAction(_:)), for: .touchUpInside)
        deleteBtn.addTarget(self, action: #selector(deleteUserAction(_:)), for: .touchUpInside)
    }

    @objc func getUserAction(_ sender: Any) {
        
        activityIndicator.startAnimating()
        NetworkingProvider.shared.getUser(id: 1828, success: { (user) in
              
            self.activityIndicator.stopAnimating()

            self.setup(user: user)
        }) { (error) in

           self.activityIndicator.stopAnimating()
           
           self.nameLabel.text = error.debugDescription
                
        }

    }
    
    @objc func addUserAction(_ sender: Any) {
        
        let newUser = NewUser(name: "Edax182", email: "mouressssdev@test.com", gender: "Male", status: "Active")
        
       //activityIndicator.startAnimating()
        
        NetworkingProvider.shared.addUser(user: newUser, success: { (user) in
            self.activityIndicator.stopAnimating()
            self.setup(user: user)
        }) { (error) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
            print(error.debugDescription)
        }
    }
    
    @objc func updateUserAction(_ sender: Any) {
        
        let newUser = NewUser(name: "MoureDev 2", email: nil, gender: nil, status: nil)
        
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.updateUser(id: 1828, user: newUser, success: { (user) in
             self.activityIndicator.stopAnimating()
                       
                       self.setup(user: user)
        }) { (erorr) in
             self.activityIndicator.stopAnimating()
                       
                       self.nameLabel.text = erorr.debugDescription
        }
        
        
    }
    
    @objc func deleteUserAction(_ sender: Any) {
        
        activityIndicator.startAnimating()
        
        let id = 1828
        
        NetworkingProvider.shared.deleteUser(id: id, success: {
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = "Se ha borrado el usuario con ID: \(id)"
            self.emailLabel.text = ""
            self.idLabel.text = ""
        }) { (error) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
        }
    }
    
    @objc func downloadImageAction(_ sender: Any) {
        
       
    }
    
    private func setup(user: User) {
        
        nameLabel.text = user.name
        emailLabel.text = user.email
        idLabel.text = user.id?.description
    }
    
}

