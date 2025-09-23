//
//  ViewController.swift
//  4.1
//
//  Created by 이정은 on 9/23/25.
//

import UIKit
import SnapKit

class MyCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let items = Array(1...20)
    
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: MyCollectionViewFlowLayout(columns: 3)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            MyCollectionViewCell.self,
            forCellWithReuseIdentifier: MyCollectionViewCell.identifier
        )
        
        view.addSubview(collectionView)
    }
    
    func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
    }
    // 테이블뷰와 동일
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 테이블뷰와 동일
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MyCollectionViewCell.identifier,
                for: indexPath
            ) as? MyCollectionViewCell
        else { return .init() }
        
        let item = items[indexPath.item]
        cell.configure(number: item)
        return cell
    }
    
    // 셀 아이템 사이즈 계산
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? MyCollectionViewFlowLayout else { return .init() }
        return layout.itemSize(for: collectionView)
    }
}
