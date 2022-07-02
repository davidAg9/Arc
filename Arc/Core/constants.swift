//
//  constants.swift
//  Arc
//
//  Created by Dave Agyakwa on 22/04/2022.
//

import Foundation
import CloudKit
enum ArcRecordType: String {
    case arcUsers
    case arrPages
    
    var rawValue: String{
        switch self {
            case .arcUsers :
                return "ArcUsers"
            case .arrPages :
                return "ArcPages"
        }
    }
    
}
