//
//  ModalError.swift
//  6.1
//
//  Created by 이정은 on 10/2/25.
//

import Foundation

// 에러 예외처리 상황
enum ModalError: Error {
    case emailEmpty
    case passwordEmpty
    case invalidURL
    case invalidRequest
    case encodeFailed
    case responseError
    case loginError
    case taskError
    
    var errorTitle: String {
        switch self {
        case .emailEmpty:
            return "이메일을 입력해주세요."
        case .passwordEmpty:
            return "비밀번호를 입력해주세요."
        case .invalidURL:
            return "유효하지 않은 URL 입니다."
        case .invalidRequest:
            return "유효하지 않은 요청입니다."
        case .encodeFailed:
            return "리퀘스트 인코딩에 실패했습니다."
        case .responseError:
            return "유효하지 않은 응답입니다."
        case .loginError:
            return "로그인에 실패했습니다."
        case .taskError:
            return "네트워크 에러가 발생했습니다."
        }
    }
}
