//
//  ViewController.swift
//  FirebaseLoginEd
//
//  Created by Miguel Ledezma on 08/10/20.
//  Copyright © 2020 Miguel Ledezma. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    var logo : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.layer.cornerRadius = 50
        
        return image
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let emailTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.placeholder = (" Email")
        
        return text
    }()
    
    let passwordTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.placeholder = (" Contraseña")
        
        text.isSecureTextEntry = true
        return text
    }()
    
    let initSessionBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        btn.imageEdgeInsets.left = -100
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitle("Iniciar Session", for: .normal)
        //btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        btn.tintColor = .white
        return btn
    }()
    
    let registerUserBtn : UIButton = {
           let btn = UIButton()
           btn.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
           btn.translatesAutoresizingMaskIntoConstraints = false
           btn.layer.cornerRadius = 10
           btn.setImage(UIImage(systemName: "arrow.right"), for: .normal)
           btn.imageEdgeInsets.left = -100
           btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
           btn.setTitle("Registrarse", for: .normal)
           //btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
           btn.tintColor = .white
           return btn
       }()

    
    let lineBottonH: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(logo)
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(lineBottonH)
        view.addSubview(passwordTextField)
        view.addSubview(initSessionBtn)
        
              view.addSubview(registerUserBtn)
        
        NSLayoutConstraint.activate([
            
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140),
            logo.widthAnchor.constraint(equalToConstant: 150),
            logo.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 5),
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
            
            registerUserBtn.topAnchor.constraint(equalTo: initSessionBtn.bottomAnchor,constant: 20),
            registerUserBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            registerUserBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            registerUserBtn.heightAnchor.constraint(equalToConstant: view.frame.height / 12),
            
        ])
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        

        registerUserBtn.addTarget(self, action: #selector(RegosterUser), for: .touchUpInside)
        
        initSessionBtn.addTarget(self, action: #selector(loginBtn), for: .touchUpInside)
        
        
 
        
    }
    @objc func loginBtn() {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Form is not valid")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                print(error ?? "Error al loguearte")
                return
            }
            
            //successfully logged in our user
            let homeController = HomeController()
            let homeControllerNavigation = UINavigationController(rootViewController: homeController)
            homeControllerNavigation.modalPresentationStyle = .fullScreen
            self.present(homeControllerNavigation, animated: true, completion: nil)
            
            //self.dismiss(animated: true, completion: nil)
            
        })
    }


    
    @objc func RegosterUser() {
        //print("Cerrar session")
        let loginController =  RegisterUserController()
        let loginNavigationController = UINavigationController(rootViewController: loginController)
        loginNavigationController.modalPresentationStyle = .fullScreen
        loginNavigationController.navigationBar.isHidden = true
        self.present(loginNavigationController, animated: true, completion: nil)
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
