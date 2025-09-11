//
//  PasswordView.swift
//  3.1
//
//  Created by 이정은 on 9/11/25.
//

import UIKit
import SnapKit

class PasswordView: UIView {

    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let passwordButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        [passwordLabel, passwordTextField, passwordButton].forEach {
            addSubview($0)
    }
        passwordLabel.text = "비밀번호를 입력하세요"
        
        passwordTextField.borderStyle = .roundedRect
        
        passwordButton.setTitle("입력", for: .normal)
        passwordButton.backgroundColor = .red
        
    }
    
    func setConstraints() {
        // passwordLabel 정가운데 정렬
        passwordLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(passwordLabel.snp.top).offset(-10)
        }
        
        passwordButton.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordLabel.snp.bottom).offset(10)
        }
    }
    
    
}
