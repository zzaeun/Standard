//
//  ViewController.swift
//  4.2
//
//  Created by 이정은 on 9/23/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let datas = [
        ["A", "B", "C", "D", "E"],        // 배너 section
        Array(1...30).map { "\($0)" }         // grid section
    ]
    
    lazy var mainCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: self.createLayout()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
    }
    
    func configureUI() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        mainCollectionView.register (
            BannerCell.self,
            forCellWithReuseIdentifier: BannerCell.identifier
        )
        
        mainCollectionView.register (
            GridCell.self,
            forCellWithReuseIdentifier: GridCell.identifier
        )
        view.addSubview(mainCollectionView)
    }
    
    func setConstraints() {
        mainCollectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // 우리가 만들 레이아웃
    func createLayout() -> UICollectionViewCompositionalLayout {
    
        return .init { [weak self] section, _ in
            if section == 0 {
                return ViewController.bannerSection()
            } else {
                return ViewController.gridSection()
            }
        }
    }
    
    static func bannerSection() -> NSCollectionLayoutSection {
        // 배너의 아이템
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // 배너의 그룹
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(160))
        // 그룹안에 item을 수평으로 배치
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // 배너의 섹션
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        section.interGroupSpacing = 8
        return section
    }
    
    static func gridSection() -> NSCollectionLayoutSection {
        // gride의 아이템
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // grid의 그룹
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // grid의 섹션
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        return section
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = datas[indexPath.section][indexPath.item]
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell
            else {
                return UICollectionViewCell()
            }
            cell.configure(title: data)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.identifier, for: indexPath) as? GridCell
            else {
                return UICollectionViewCell()
            }
            cell.gridLabel.text = data
            return cell
        }
    }
}

