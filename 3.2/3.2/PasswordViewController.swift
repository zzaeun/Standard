//
//  ViewController.swift
//  3.2
//
//  Created by 이정은 on 9/15/25.
//

import UIKit
import SnapKit

class PasswordViewController: UIViewController {
    let passwordView = PasswordView()
    let passwordValidator = PasswordValidator()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(passwordView)
        passwordView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        passwordView.passwordButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc
    func tappedButton() {
        
        guard let input = passwordView.passwordTextField.text else { return }
        do {
            let isValid = try passwordValidator.validate(with: input)
            if isValid { passwordView.passwordLabel.text = "성공"}
        } catch {
            guard let error = error as? PasswordError else { return }
            presentAlert(with: error)
        }
    }
    
    // error 메시지를 작성해놨으니까 파라미터를 받기 위해 with~ 작성
    func presentAlert(with error: PasswordError) {
        let alert = UIAlertController(title: "에러 발생", message: error.message, preferredStyle: .alert)
        alert.addAction(.init(title: "확인", style: .default))
        present(alert, animated: true)
    }

}
