//
//  LoginRequest.swift
//  6.1
//
//  Created by 이정은 on 10/2/25.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}
