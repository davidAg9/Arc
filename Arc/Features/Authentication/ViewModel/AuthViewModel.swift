//
//  AuthViewModel.swift
//  Arc
//
//  Created by Dave Agyakwa on 19/04/2022.
//


import Foundation
import AuthenticationServices
import RealmSwift

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var persmissionStatus = false
    @Published private(set) var userSignedIn: Bool = false
    @Published var errMsg: String?
    private let authService: AuthService
    @Published var currentArcUser: User?
    init() {
      
        self.authService = AuthService(app: ArcStoreService.shared.app!)
        signIn()
//        autoLogin()
    }

    func signIn() {
        Task {
            
            guard  let user = try? await authService.SignIn()else {
                return
            }
                // generate page number
                currentArcUser = user
                // create user and save to the database
            
                userSignedIn = true
            }
       
    }
    
    /// Creates a cryptographically unique page number for a given user
    /// - Returns: Integer
    private func generatePageNumber() -> Int {
        // generate a 9 digit number
        let ranNum = ACRandomGenerator.generateNumber()
        
        // check database if exist
   
        if true {
            return generatePageNumber()
        }
        // if exists recursive
    }
    
    func autoLogin() {
        Task {
   
                // get user data from cloudkit
                
                userSignedIn = true
            }
        }

  

}
  

