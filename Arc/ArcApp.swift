//
//  ArcApp.swift
//  Arc
//
//  Created by Dave Agyakwa on 15/04/2022.
//

import SwiftUI

@main
struct ArcApp: App {
    @Environment(\.scenePhase) var scenePhase
    let persistentContainer :ArcStoreService = .shared
    @StateObject private  var authVm :AuthViewModel
    init() {
        _authVm = StateObject(wrappedValue: AuthViewModel())
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUsatisfiable")
                }
                .environment(\.realm, persistentContainer.realm)
                .environmentObject(authVm)
        }
//        .onChange(of: scenePhase) { _ in
//            persistentContainer.save()
//        }
    }
}
