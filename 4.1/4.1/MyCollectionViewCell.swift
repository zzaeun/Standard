//
//  ViewController.swift
//  4.1
//
//  Created by 이정은 on 9/23/25.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    let numberLabel = UILabel()
    static let identifier = "numberCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
  
  func configureUI() {
    numberLabel.textAlignment = .center
    
    contentView.backgroundColor = .systemGray5
    contentView.layer.cornerRadius = 12
    contentView.layer.masksToBounds = true
    contentView.addSubview(numberLabel)
  }
  
  func setConstraints() {
      numberLabel.snp.makeConstraints {
          $0.edges.equalToSuperview().inset(16)
    }
  }
  
  func configure(number: Int) {
    numberLabel.text = "\(number)"
  }
}
