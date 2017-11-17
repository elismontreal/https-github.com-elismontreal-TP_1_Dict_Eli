//
//  TableController.swift
//  Dictionaire
//
//  Created by Elisangela dos Santos on 17-11-14.
//  Copyright © 2017 Elisangela dos Santos. All rights reserved.
//
//============================
import UIKit
//============================
class TableController: UIViewController {
    
    //Variables et connections
    @IBOutlet weak var motFrancais: UITextField!
    @IBOutlet weak var motAnglais: UITextField!
    var arrFrancais: [String]!
    var arrAnglais: [String]!
   
    //Lorsque le document est prêt
    override func viewDidLoad() {
        super.viewDidLoad()
        managerUser()
    }
    
    // Ajouter les mots et sauvagarder à memoire
    @IBAction func btnAjouter(_ sender: UIButton) {
        
        arrFrancais.append(motFrancais.text!)
        arrAnglais.append(motAnglais.text!)
        UserDefaults.standard.set(arrFrancais, forKey: "francais")
        UserDefaults.standard.set(arrAnglais, forKey: "anglais")
        motFrancais.text = ""
        motAnglais.text = ""
        let alertController = UIAlertController(title: "Alerte",
                                                message: "On ajoute de nouveau mot dans le dictionaire!",
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Fermer", style:
        UIAlertActionStyle.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    //function por verifier les itens dans la memoire
    func managerUser(){
        if UserDefaults.standard.object(forKey: "francais") != nil {
            arrFrancais = UserDefaults.standard.object(forKey: "francais") as! [String]
            arrAnglais = UserDefaults.standard.object(forKey: "anglais") as! [String]
        }else {
            arrFrancais = [String]()
            arrAnglais = [String]()
        }
    }
    
}
