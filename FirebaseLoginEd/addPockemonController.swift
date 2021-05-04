//
//  addPockemonController.swift
//  FirebaseLoginEd
//
//  Created by Miguel Ledezma on 09/10/20.
//  Copyright © 2020 Miguel Ledezma. All rights reserved.
//
import UIKit
import AlamofireImage
import Alamofire

class AddPockemonControoler: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    
    
    
     let imagePicker = UIImagePickerController()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Agregar"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
     let namePockemonText : UITextField = {
           let text = UITextField()
           text.translatesAutoresizingMaskIntoConstraints = false
           text.font = text.font?.withSize(15)
           text.placeholder = ("Nombre")
       return text
       }()
    
    
    
    let imgView : UIImageView = {
          let img = UIImageView()
           img.translatesAutoresizingMaskIntoConstraints = false
           img.backgroundColor = .yellow
           return img
       }()
       
    
    let addImg: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitle("Seleccionar Imagen", for: .normal)
        btn.tintColor = .white
        return btn
    }()
    

    let confirmBtn : UIButton = {
         let btn = UIButton()
             btn.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
             btn.translatesAutoresizingMaskIntoConstraints = false
             btn.layer.cornerRadius = 10
             btn.titleLabel?.font = btn.titleLabel?.font.withSize(15)
             btn.setTitle("Agregar", for: .normal)
            btn.setTitleColor(.white, for: .normal)
         return btn
         }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        

        view.addSubview(titleLabel)
        view.addSubview(namePockemonText)
        view.addSubview(imgView)
        view.addSubview(addImg)
        view.addSubview(confirmBtn)
        
        imagePicker.delegate = self
             
        NSLayoutConstraint.activate([
            
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            titleLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            
            namePockemonText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            namePockemonText.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            namePockemonText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            namePockemonText.heightAnchor.constraint(equalToConstant: 50),
            
            
            imgView.topAnchor.constraint(equalTo: namePockemonText.bottomAnchor,constant: 5),
            imgView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            imgView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            imgView.heightAnchor.constraint(equalToConstant: 100),
            
            addImg.topAnchor.constraint(equalTo: imgView.bottomAnchor,constant: 20),
            addImg.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            addImg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            addImg.heightAnchor.constraint(equalToConstant: view.frame.height / 12),
            
            confirmBtn.topAnchor.constraint(equalTo: addImg.bottomAnchor,constant: 20),
            confirmBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            confirmBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            confirmBtn.heightAnchor.constraint(equalToConstant: view.frame.height / 12),
            
        ])
        
        addImg.addTarget(self, action: #selector(acctionBtnGaleria), for: .touchUpInside)
         confirmBtn.addTarget(self, action: #selector(addpockemon), for: .touchUpInside)
        
    }
    @objc func addpockemon(_sender : UIButton) {
        
        let name = namePockemonText.text
        let img = "https://s3-us-west-2.amazonaws.com/lasaga-blog/media/images/grupo_imagen.original.jpg"
       //let img = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
           
      
   }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgView.image = img
        print("img->",img.description)
        dismiss(animated: true,completion: nil)
    }
    
     @objc func acctionBtnGaleria(_sender : UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = ["public.image"]
        self.present(imagePicker, animated: true, completion: nil)
    }
  
}
