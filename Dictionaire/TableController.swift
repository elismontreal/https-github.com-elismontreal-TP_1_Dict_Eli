//
//  TableController.swift
//  Dictionaire
//
//  Created by Elisangela dos Santos on 17-11-14.
//  Copyright © 2017 Elisangela dos Santos. All rights reserved.
//

import UIKit

class TableController: UIViewController {
    
    @IBOutlet weak var motFrancais: UITextField!
    @IBOutlet weak var motAnglais: UITextField!
   
    var arrFrancais: [String]!
    var arrAnglais: [String]!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        managerUser()
       
    }
    
    @IBAction func btnAjouter(_ sender: UIButton) {
        
        arrFrancais.append(motFrancais.text!)
        arrAnglais.append(motAnglais.text!)
        UserDefaults.standard.set(arrFrancais, forKey: "francais")
        UserDefaults.standard.set(arrAnglais, forKey: "anglais")
        
    }
    
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
