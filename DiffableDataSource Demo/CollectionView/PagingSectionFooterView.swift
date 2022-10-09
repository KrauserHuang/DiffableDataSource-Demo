//
//  PagingSectionFooterView.swift
//  DiffableDataSource Demo
//
//  Created by Tai Chin Huang on 2022/10/6.
//

import UIKit

class PagingSectionFooterView: UICollectionReusableView {
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.isUserInteractionEnabled = true
        pageControl.currentPageIndicatorTintColor = .systemOrange
        pageControl.pageIndicatorTintColor = .systemGray5
        pageControl.hidesForSinglePage = true
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func configure(with numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages //拿來跟collectionView的model數量做連結
    }
}
