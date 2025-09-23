//
//  MyCollectionViewFlowLayout.swift
//  4.1
//
//  Created by 이정은 on 9/23/25.
//

import UIKit

class MyCollectionViewFlowLayout: UICollectionViewFlowLayout {
  
  private let columns: CGFloat
  private let sectionInsetValue: CGFloat
  private let itemSpacing: CGFloat
  private let rowSpacing: CGFloat
  private let itemHeight: CGFloat
  
  init(columns: CGFloat = 3,
       sectionInset: CGFloat = 16,
       itemSpacing: CGFloat = 7,
       rowSpacing: CGFloat = 7,
       itemHeight: CGFloat = 75) {
    self.columns = columns
    self.sectionInsetValue = sectionInset
    self.itemSpacing = itemSpacing
    self.rowSpacing = rowSpacing
    self.itemHeight = itemHeight
    super.init()
    
    scrollDirection = .vertical
    minimumInteritemSpacing = itemSpacing
    minimumLineSpacing = rowSpacing
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // 셀 크기 계산
  func itemSize(for collectionView: UICollectionView) -> CGSize {
    
    // 전체 컬렉션뷰 가로길이
    let width = collectionView.bounds.width
    
    // 전체 가로 길이 - 여백 = 셀 전체가 사용가능한 가로 길이
    let availableWidth = (width
                          - (sectionInset.left + sectionInset.right)
                          - minimumInteritemSpacing * (columns - 1))
    
    // 셀 하나의 가로 길이
    let itemWidth = availableWidth / columns
    
    return CGSize(width: itemWidth, height: itemHeight)
  }
}
