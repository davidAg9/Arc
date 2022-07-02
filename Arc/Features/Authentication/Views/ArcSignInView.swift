//
//  ArcSignInView.swift
//  Arc
//
//  Created by Dave Agyakwa on 19/04/2022.
//

import SwiftUI
import AuthenticationServices

struct ArcSignInView: View {
    @EnvironmentObject var authVm:AuthViewModel
    var body: some View {
        VStack{
            Text("Welcome to Arc")
            Text("Join us to start sending Pages")
            
            Button {
                
            } label: {
                Text("Get Started")
                    .font(.title)
                    .fontWeight(.heavy)
                    .frame(width: 200, height: 25)
                    .foregroundColor(.accentColor)
                   
                    
            }
            
            SignInWithAppleButton(.continue) { onrequest in
                onrequest.requestedScopes = [.email]
                
            } onCompletion: { result in
                switch result {
                    case .failure(let err):
                        print("\(String(describing:err.localizedDescription))")
                    case .success(let auth):
                        authVm.signIn()
                }
               
            }


            
        }.background(Color("arcbackground"))
           
    }
}

struct ArcSignInView_Previews: PreviewProvider {
    static var previews: some View {
        ArcSignInView()
            .environmentObject(AuthViewModel())
    }
}
