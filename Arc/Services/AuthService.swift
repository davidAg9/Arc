//
//  AuthService.swift
//  Arc
//
//  Created by Dave Agyakwa on 19/04/2022.
//

import Foundation
import CryptoKit
import RealmSwift

final class AuthService {
    let app:App
    init(app:App) {
        self.app = app
    }
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: Array<Character> =
          Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
     func generateNonce() -> (raw:String, hash:String) {
       let str = randomNonceString()
       return (str, sha256(str))
    }
    
    
    
    func SignIn(anon:Bool = true) async throws-> User {
       return try await  app.login(credentials: Credentials.anonymous)
    }
    
}

