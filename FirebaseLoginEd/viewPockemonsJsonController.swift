//
//  viewPockemonsJsonController.swift
//  FirebaseLoginEd
//
//  Created by Miguel Ledezma on 09/10/20.
//  Copyright © 2020 Miguel Ledezma. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewPocjemonsController : UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    var jsonArray: NSArray?
    var nameArray: Array<String> = []
    var imageURLArray: Array<String> = []
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
         downloadDataFromAPI()
        
 
        //Agregar Colloection de ordenes pendientes
        collectionView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        collectionView.register(PockemonsCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView.contentInset = UIEdgeInsets(top: 20,left: 0,bottom: 0,right: 0)
                     
    }
    //Función que descargará los datos de nuestra API alojada en Apiary
    func downloadDataFromAPI(){
        
    //1.
    AF.request("https://private-6592e5-eduardogonzalez1.apiary-mock.com/pokemonlist").responseJSON(completionHandler: { response in
        //2.
        if let JSON = response.value{
            //3.
            self.jsonArray = JSON as? NSArray
            //4.
            for item in self.jsonArray! as! [NSDictionary]{
            //5.
                print("asd",item)
                let name = item["name"] as? String
                let imageURL = item["image"] as? String


                self.nameArray.append(name!)

                self.imageURLArray.append((imageURL)!)
            }
            //6.
            self.collectionView.reloadData()
        }
    }).resume()


    }
    
    //1. Realizamos la llamada a nuestra API, a través de la función request() de Alamofire, utilizando la URL de Apiary

    //2. Almacenamos la respuesta del servidor (response.result.value) en la constante JSON

    //3. Utilizamos la estructura jsonArray para almacenar la respuesta del servidor, especificando que se trata de un Array. Sabemos esto, porque conocemos la estructura que tiene nuestro json en Apiary

    //4. Recorremos jsonArray y vamos recuperando cada uno de los diccionarios (Que corresponden a cada uno de los Pokemons).

    //5. Cada vez que recuperamos uno de los diccionarios, que representa a un Pokemon, recuperamos su nombre, a través de la clave “name” y su imagen a través de la clave “image” y  los almacenamos en los arrays nameArray e imageURLArray respectivamente.

    //6. Por último, es necesario que recarguemos la TableView, usando la función reloadData(), para que nuestra TableView pueda mostrar los datos que acabamos de recuperar del servidor.
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArray.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Cell que mostrara la lista de los pedidos pendientes y se le pasa el arreglo de ordenes
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! PockemonsCell
        cell.nameLabel.text = nameArray[indexPath.item]
      
        let url = URL(string: self.imageURLArray[indexPath.row])
        print("URL-->>>>><",url!)
          //cell.pokemonImage.af_setImage(withURL: url!)
        cell.img.af.setImage(withURL: url!)
       
        cell.layer.cornerRadius = 30
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20,height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
   
}
    
   

