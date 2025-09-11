//
//  ViewController.swift
//  3.1
//
//  Created by 이정은 on 9/9/25.
//

import UIKit
import SnapKit

class PasswordViewController: UIViewController {
    let passwordView = PasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(passwordView)
        passwordView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        passwordView.passwordButton.addTarget(self, action: #selector(tappedbutton), for: .touchUpInside)
    }
    
    @objc
    func tappedbutton() {
        if passwordView.passwordTextField.text == "password" {
            passwordView.passwordLabel.text = "성공"
        } else {
            passwordView.passwordLabel.text = "실패"
        }
    }

}

