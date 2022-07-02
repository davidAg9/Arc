//
//  ArcUser.swift
//  Arc
//
//  Created by Dave Agyakwa on 15/04/2022.
//

import Foundation
import RealmSwift


final class ArcUser: Object,ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var pgNumber:String
    @Persisted var email:String
}
