//
//  ModalViewController.swift
//  6.1
//
//  Created by 이정은 on 10/2/25.
//

import UIKit
import SnapKit

class ModalViewController: UIViewController {
    
    var delegate: ModalDelegateProtocol?
    private let network = NetworkService()
    
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
        modalButton.addTarget(self, action: #selector(dismissModelViewController), for: .touchUpInside)
        
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
            $0.bottom.equalTo(modalLabel.snp.top).offset(-10)
        }

    }
    
    @objc func dismissModelViewController() {
        // 텍스트필드 사용이 끝나면 키보드를 화면에서 사라지게
        passwordTextField.resignFirstResponder()
        
        do {
            let email = emailTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            
            try network.login(email: email, password: password) { result in
                
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        let token = response.token
                        self.delegate?.didModalDismiss(with: token)
                        self.dismiss(animated: true)
                    }
                case .failure(let error):
                    self.errorAlert(with: error)
                }
            }
        } catch {
            guard let error = error as? ModalError else { return }
            errorAlert(with: error)
        }
    }
    
    func errorAlert(with modalError: ModalError) {
        let alert = UIAlertController(
            title: modalError.errorTitle, message: nil, preferredStyle: .alert
        )
        alert.addAction(.init(title: "확인", style: .default))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
