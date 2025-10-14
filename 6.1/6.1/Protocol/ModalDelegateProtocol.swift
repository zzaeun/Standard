//
//  ModalDelegateProtocol.swift
//  6.1
//
//  Created by 이정은 on 10/13/25.
//

import Foundation

protocol ModalDelegateProtocol: AnyObject {
    func didModalDismiss(with token: String)
}
