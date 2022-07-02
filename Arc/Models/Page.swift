//
//  PageModel.swift
//  Arc
//
//  Created by Dave Agyakwa on 19/04/2022.
//

import Foundation
import RealmSwift


final class Page:Object,ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var message:String
    @Persisted var pgNumber:String
    @Persisted var date:Date
   
    convenience init(message:String , pgNm:String) {
        self.init()
        self.message = message
        self.pgNumber = pgNm
        self.date = Date()
    }
}
