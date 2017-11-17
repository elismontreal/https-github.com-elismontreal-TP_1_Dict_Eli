//
//  ViewController.swift
//  Dictionaire
//
//  Created by Elisangela dos Santos on 17-11-14.
//  Copyright © 2017 Elisangela dos Santos. All rights reserved.
//
//=================================
import UIKit
//=================================
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Variables et connections
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblresultat: UILabel!
    @IBOutlet weak var segControl: UISegmentedControl!
    var arrFrancais: [String]!
    var arrAnglais: [String]!
    var DictKeys:[String: String] = [:]
    
   //Lorsque que le document est prêt
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.layer.cornerRadius = 5.0
        segControl.layer.cornerRadius = 5.0
        managerUser()
        DictKeys = Dictionary(uniqueKeysWithValues: zip(arrFrancais, arrAnglais))
        
    }
    //Quantite de lignes pour la tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFrancais.count
    }
    
    //Ajouter les cell à tableau view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.textColor = UIColor.init(displayP3Red: 28/255, green: 64/255, blue: 142/255, alpha: 1.0)
        cell.textLabel?.text = [String](DictKeys.keys)[indexPath.row]
        return cell
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
    
    // Mettre la traduction de la ligne da table view dans un label
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lblresultat.text = (Array(DictKeys.values))[indexPath.row]
    }
    
    //Métode pour suprimer les mots
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       
        if editingStyle == UITableViewCellEditingStyle.delete {
            arrFrancais.remove(at: indexPath.row)
            arrAnglais.remove(at: indexPath.row)
            UserDefaults.standard.set(arrFrancais, forKey: "francais")
            UserDefaults.standard.set(arrAnglais, forKey: "anglais")
            refaireDict()
            tblView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)

        }
    }
    // Construir le dictionaire
    @IBAction func segAction(_ sender: UISegmentedControl) {
        if segControl.selectedSegmentIndex == 0{
            DictKeys = Dictionary(uniqueKeysWithValues: zip(arrFrancais, arrAnglais))
            lblresultat.text = ""
        } else {
            DictKeys = Dictionary(uniqueKeysWithValues: zip(arrAnglais, arrFrancais))
            lblresultat.text = ""
        }
        tblView.reloadData()
    }
    
    //function por refaire le Dictionaire après effacer un mot
    func refaireDict(){
        if segControl.selectedSegmentIndex == 0{
            DictKeys = Dictionary(uniqueKeysWithValues: zip(arrFrancais, arrAnglais))
            lblresultat.text = ""
        } else {
            DictKeys = Dictionary(uniqueKeysWithValues: zip(arrAnglais, arrFrancais))
            lblresultat.text = ""
        }
        
    }


}

