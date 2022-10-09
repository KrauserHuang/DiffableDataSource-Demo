//
//  UICollectionReusableView+Extension.swift
//  DiffableDataSource Demo
//
//  Created by Tai Chin Huang on 2022/10/6.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
