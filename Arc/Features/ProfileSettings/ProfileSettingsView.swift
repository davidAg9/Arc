//
//  ProfileSettingsView.swift
//  Arc
//
//  Created by Dave Agyakwa on 15/04/2022.
//

import SwiftUI

struct ProfileSettingsView: View {
    @AppStorage("globalBroadcast") var globalBroadCast: Bool = false
    @AppStorage("emergencyBroadcast") var emergencyBroadCast: Bool = true
    @AppStorage("pageNumner") var pageNumber: String = "1717-2218@arc.com"

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text(pageNumber)
                    .font(.headline)
                    .fontWeight(.bold)
                .foregroundColor(.white)
                
                }.padding(.bottom,40)
              
            Toggle(isOn: $globalBroadCast) {
                    Label {
                        Text("Global Broadcast")
                                
                    } icon: {
                        Image(systemName: "dot.radiowaves.left.and.right")
                            .font(.title)
                    }
                }
            Toggle(isOn: $emergencyBroadCast) {
                Label {
                    Text("Global Broadcast")
                            
                } icon: {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.title)
                }
            }
         
            Spacer()
            VStack(alignment:.center){
                Text("All rights reserved 2022")
            }
            
        }
        .foregroundColor(.accentColor)
        .background(Color("arcbackground"))
    }
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
