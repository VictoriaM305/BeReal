//
//  User.swift
//  lab-insta-parse
//
//  Created by Victoria McKinnie on 09/29/2024
//

import Foundation
import ParseSwift

struct User: ParseUser {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    var username: String?
    var email: String?
    var password: String?
    var emailVerified: Bool?
    var authData: [String : [String : String]?]?
}

