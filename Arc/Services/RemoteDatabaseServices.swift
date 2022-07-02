//
//  RemoteDatabaseServices.swift
//  Arc
//
//  Created by Dave Agyakwa on 19/04/2022.
//

import Foundation

protocol RemoteDatabaseProtocol {
    func saveUser (user:ArcUser)
    func fetchUser(userid:String) -> ArcUser?
    func sendPage(page:Page)
//    func sendGlobalPage(page:Page)
//    func sendEmergencyPage(with page:Page, to:[Page])
}

class RemoteDatabaseService :RemoteDatabaseProtocol {
    private let storeService :ArcStoreService
    
    init() {
        self.storeService = .shared
    }
    
    func saveUser(user:ArcUser) {
       try? storeService.realm.write {
           storeService.realm.add(user)
        }
       
    }
    
    func fetchUser(userid:String) -> ArcUser? {
      storeService.realm.object(ofType: ArcUser.self, forPrimaryKey: userid )
    }
    
    func sendPage(page: Page) {
        try? storeService.realm.write {
            storeService.realm.add(page)
         }
    }
    
//    func sendGlobalPage(page: Page) {
//
//    }
//
//    func sendEmergencyPage(with page: Page, to: [Page]) {
//
//    }
//
    
}
