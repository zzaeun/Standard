//
//  PasswordError.swift
//  3.2
//
//  Created by 이정은 on 9/15/25.
//

import UIKit
import SnapKit

enum PasswordError: Error {
    case emptyInput
    case tooLongInput
    case wrongInput
    
    var message: String {
        switch self {
        case .emptyInput:
            return "패스워드를 입력해주세요."
        case .tooLongInput:
            return "패스워드는 8자 이하 입니다."
        case .wrongInput:
            return "패스워드가 틀렸습니다."
        }
    }
}
