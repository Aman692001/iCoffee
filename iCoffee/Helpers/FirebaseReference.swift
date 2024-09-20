//
//  FirebaseReference.swift
//  iCoffee
//
//  Created by Aman on 14/05/23.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case Menu
    case Order
    case Basket
}

func FirebaseReference(_ collectionReference: FCollectionReference) ->
    CollectionReference {
    
        return Firestore.firestore().collection(collectionReference.rawValue)
}
