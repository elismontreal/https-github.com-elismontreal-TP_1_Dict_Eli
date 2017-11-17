//
//  UserDefaultsManager.swift
//  JoliePoker
//
//  Created by Elisangela dos Santos on 17-10-18.
//  Copyright © 2017 Elisangela dos Santos. All rights reserved.
//
//===============
import Foundation
//===============
class UserDefaultsManager {
    //le metode pour verifier se le valeur est deja sauvegarder
    func doesKeyExist(theKey: String) -> Bool { // parametre por savoir quoi je cherche (ex.credit)
        if UserDefaults.standard.object(forKey: theKey) == nil {
            return false
        }
        return true
    }
    //-- Pour sauvegarder un valeur, utiliser le class UserDefault et le metode standard.set(prendre le valeur)
    func setKey(theValue: AnyObject, theKey: String) {
        UserDefaults.standard.set(theValue, forKey: theKey)
    }
    //---Pour retirer le valeur dans la memoire
    func removeKey(theKey: String) {
        UserDefaults.standard.removeObject(forKey: theKey)
    }
    //---Prendre le valeur
    func getvalue(theKey: String) -> AnyObject {
        return UserDefaults.standard.object(forKey: theKey) as AnyObject
        
    }
}
//===============



