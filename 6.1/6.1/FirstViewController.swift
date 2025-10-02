//
//  FirstViewController.swift
//  6.1
//
//  Created by 이정은 on 10/2/25.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    private let firstLabel = UILabel()
    private let firstButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
        
        firstButton.addTarget(self, action: #selector(firstButtonTapped), for: .touchUpInside)
    }
    
    private func configureUI() {
        view.backgroundColor = .gray
        firstLabel.text = "First ViewController"
        
        firstButton.setTitle("First button", for: .normal)
        [firstLabel, firstButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setConstraints() {
        firstLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        firstButton.snp.makeConstraints {
            $0.centerX.equalTo(firstLabel.snp.centerX)
            $0.top.equalTo(firstLabel.snp.bottom).offset(8)
        }
    }
    
    @objc private func firstButtonTapped() {
        let modalVC = ModalViewController()
        modalVC.modalPresentationStyle = .formSheet
        present(modalVC, animated: true)
    }
}
