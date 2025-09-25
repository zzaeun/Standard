//
//  GirdCell.swift
//  4.2
//
//  Created by 이정은 on 9/24/25.
//

import UIKit

class GridCell: UICollectionViewCell {
    static let identifier = "GridCell"
    
    let gridLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints() 
    }
    
    func configureUI() {
        gridLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        gridLabel.textAlignment = .center
        gridLabel.backgroundColor = .systemGray5
        gridLabel.layer.cornerRadius = 8
        gridLabel.layer.masksToBounds = true
        
        contentView.addSubview(gridLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        gridLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(4)
        }
    }
}
