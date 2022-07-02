//
//  PageRecieverViewModel.swift
//  Arc
//
//  Created by Dave Agyakwa on 18/04/2022.
//

import Foundation
import RealmSwift

final class PageRecieverViewModel: ObservableObject {
    @Published var pages:[Page] = []
    
    private var store: ArcStoreService = .shared
    
    func fetchNewPages(forNumber id: String, today: Bool = true) {
        var items = store.realm.objects(Page.self).filter("date ", Date())
    }
    
    func delete(page: Page) {
    
      
        store.realm.delete(page)
    }

    
    private func saveToLocal() {
        
    }
}
