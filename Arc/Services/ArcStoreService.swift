//
//  ArcStoreService.swift
//  Arc
//
//  Created by Dave Agyakwa on 17/04/2022.
//

import Foundation
import RealmSwift


final class ArcStoreService {
    static let shared = ArcStoreService()
    let realm:Realm
    let app:App?
    init(inMemory:Bool = false) {
        if inMemory {
            // Open the realm with a specific in-memory identifier.
            let identifier = "localRealm"
            let config = Realm.Configuration(
                inMemoryIdentifier: identifier)
            // Open the realm
            self.app = nil
            self.realm = try! Realm(configuration: config)
            return
        }
        self.app =  App(id: "arcmobile-ikqvr")
        
        self.realm = try! Realm(configuration:)
        
        
    }
    
    // A test configuration for SwiftUI previews
    static var preview: ArcStoreService = {
        let controller = ArcStoreService(inMemory: true)
        
        // Create 10 example Pages.
        var items = controller.realm.objects(Page.self)
        if items.count == 0 {
           try! controller.realm.write {
                    for num in 0..<10 {
                    controller.realm.add(Page(message: "message\(num)", pgNm: "172666"))
                 }
            }
        
            
        }
        return controller
    }()


}
