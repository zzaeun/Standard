//
//  ModalViewController.swift
//  6.1
//
//  Created by 이정은 on 10/2/25.
//

import UIKit
import SnapKit

class ModalViewController: UIViewController {
    private let modalLabel = UILabel()
    private let modalButton = UIButton()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        configureUI()
        setConstraints()
    }
    
    private func configureUI() {
        modalLabel.text = "Modal ViewController"
        modalButton.setTitle("Modal Button", for: .normal)
        emailTextField.borderStyle = .roundedRect
        passwordTextField.borderStyle = .roundedRect
        
        [modalLabel, modalButton, emailTextField, passwordTextField].forEach {
            view.addSubview($0)
        }
    }
    
    private func setConstraints() {
        modalLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        modalButton.snp.makeConstraints {
            $0.centerX.equalTo(modalLabel.snp.centerX)
            $0.top.equalTo(modalLabel.snp.bottom).offset(8)
        }
        
        emailTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.bottom.equalTo(passwordTextField.snp.top).offset(-10)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.bottom.equalTo(modalLabel.snp.top).offset(-10)        }

    }
}
