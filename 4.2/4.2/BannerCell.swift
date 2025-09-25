//
//  BannerCell.swift
//  4.2
//
//  Created by 이정은 on 9/24/25.
//

import UIKit

class BannerCell: UICollectionViewCell {
    static let identifier = "BannerCell"
    
    let titleLabel = UILabel()
    let bgView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        titleLabel.font = .systemFont(ofSize: 22, weight: .bold)
        titleLabel.textColor = .white
        
        bgView.layer.cornerRadius = 16
        bgView.backgroundColor = .purple
        
        contentView.addSubview(bgView)
        bgView.addSubview(titleLabel)
    }
    
    func setConstraints() {
        bgView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // bannerCell 생성
    func configure(title: String) {
        titleLabel.text = title
    }
}
