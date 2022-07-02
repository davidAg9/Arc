//
//  PageRecieverView.swift
//  Arc
//
//  Created by Dave Agyakwa on 15/04/2022.
//

import RealmSwift
import SwiftUI

struct PageRecieverView: View {
    @ObservedResults(Page.self) var pages
//    @StateObject private var vm = PageRecieverViewModel()

    var body: some View {
        VStack {
            List {
                Section(header: Text("Pages")) {
                    ForEach(pages) { page in
                        HStack {
                            Text(page.date, format: .dateTime)
                            Text(page.message)
                        }
                    }.onDelete(perform: $pages.remove)
                    .listRowBackground(Color(.arcBackground))
                    
                }.headerProminence(.increased)
            
                
            }.listStyle(.plain)
        

        }
            .foregroundColor(.accentColor)
            .background(Color(.arcBackground))
            .navigationBarColor(backgroundColor: .arcBackground, titleColor: .white)
    }
}

struct PageRecieverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PageRecieverView()
                .environment(\.realm, ArcStoreService.preview.realm)
        }
    }
}
