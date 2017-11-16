//
//  ViewController.swift
//  Dictionaire
//
//  Created by Elisangela dos Santos on 17-11-14.
//  Copyright © 2017 Elisangela dos Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var lblresultat: UILabel!
    var arrFrancais: [String]!
    var arrAnglais: [String]!
    var DictKeys:[String: String] = [:]
   
    
    @IBOutlet weak var segControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managerUser()
        
        DictKeys = Dictionary(uniqueKeysWithValues: zip(arrFrancais, arrAnglais))
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFrancais.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
    
        cell.textLabel?.text = [String](DictKeys.keys)[indexPath.row]
        return cell
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lblresultat.text = (Array(DictKeys.values))[indexPath.row]
    }
   

    @IBAction func segAction(_ sender: UISegmentedControl) {
        if segControl.selectedSegmentIndex == 0{
            DictKeys = Dictionary(uniqueKeysWithValues: zip(arrFrancais, arrAnglais))
        } else {
            DictKeys = Dictionary(uniqueKeysWithValues: zip(arrAnglais, arrFrancais))
        }
        tblView.reloadData()
    }


}

