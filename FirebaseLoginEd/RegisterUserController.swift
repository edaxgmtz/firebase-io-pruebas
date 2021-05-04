//
//  RegisterUserController.swift
//  FirebaseLoginEd
//
//  Created by Miguel Ledezma on 08/10/20.
//  Copyright © 2020 Miguel Ledezma. All rights reserved.

import UIKit
import FirebaseAuth

class RegisterUserController: UIViewController {
    
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Registrar"
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
    
    let initSessionBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        btn.imageEdgeInsets.left = -100
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitle("Registrarse", for: .normal)
        btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        btn.tintColor = .white
        return btn
    }()
    
    @objc func handleLogin() {
        let email = emailTextField.text
        let password = passwordTextField.text
    }
    
    let lineBottonH: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
 
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(lineBottonH)
        view.addSubview(passwordTextField)
        view.addSubview(initSessionBtn)
        
        NSLayoutConstraint.activate([
            
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            titleLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            lineBottonH.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 2.5),
            lineBottonH.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            lineBottonH.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            lineBottonH.heightAnchor.constraint(equalToConstant: 1),
            
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 5),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
                       
            
            initSessionBtn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 20),
            initSessionBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            initSessionBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            initSessionBtn.heightAnchor.constraint(equalToConstant: view.frame.height / 12),
            
        ])
        /*
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        */
        
        
        initSessionBtn.addTarget(self, action: #selector(RegosterUser), for: .touchUpInside)
    }
    
    @objc func RegosterUser() {
           //print("Cerrar session")
            
        self.dismissKeyboard()
        
        
        print("Recibo text email : ",(emailTextField.text)!)
        print("Recibo text pass : ",(passwordTextField.text)!)
        
        //Auth.auth().createUser(withEmail: emailTextField.text, password: passwordTextField.text, completion: AuthResultCallback , Error in )
        Auth.auth().createUser(withEmail: (emailTextField.text)!, password: (passwordTextField.text)!, completion: nil)
        
        
        navigationController?.dismiss(animated: true, completion: nil)
       }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
