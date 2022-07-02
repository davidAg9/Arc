//
//  ContentView.swift
//  Arc
//
//  Created by Dave Agyakwa on 15/04/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authVm :AuthViewModel
    @State private var selectedIndex = 0
    var body: some View {
        NavigationView {
            if  authVm.userSignedIn{
                TabView(selection:$selectedIndex){
                    PageRecieverView()
                        .navigationBarHidden(true)
                        .tabItem {
                            Image(systemName: "dot.radiowaves.left.and.right")
                        }.tag(0)
                    
                    ProfileSettingsView()
                        .tabItem {
                            Image(systemName: "person")
                        }.tag(1)

                }.ignoresSafeArea()
                .foregroundColor(.accentColor)
                .background(Color(.arcBackground))
            }else {
                ArcSignInView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
