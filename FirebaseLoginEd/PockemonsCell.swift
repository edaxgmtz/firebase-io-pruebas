//
//  PockemonsCell.swift
//  FirebaseLoginEd
//
//  Created by Miguel Ledezma on 09/10/20.
//  Copyright © 2020 Miguel Ledezma. All rights reserved.
//
import UIKit

class PockemonsCell : UICollectionViewCell {
    
 
    let nameLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "namePockemon"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .black
        return label
    }()
    
    var img : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .lightGray
  
    return image
    }()

      override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
         addSubview(img)
        addSubview(nameLabel)
       
        //Constrains
      NSLayoutConstraint.activate([
                 
        img.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        img.centerXAnchor.constraint(equalTo: centerXAnchor),
        img.widthAnchor.constraint(equalToConstant: 80),
        img.heightAnchor.constraint(equalToConstant: 80),

        nameLabel.topAnchor.constraint(equalTo: img.bottomAnchor,constant: 20 ),
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor),
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor),
        nameLabel.heightAnchor.constraint(equalToConstant: 20),
                             
        
        ])
          
      }
        
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }

}
