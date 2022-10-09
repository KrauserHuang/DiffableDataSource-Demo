//
//  LayoutType.swift
//  DiffableDataSource Demo
//
//  Created by Tai Chin Huang on 2022/10/5.
//

import UIKit

enum ExampleLayout {
    case list
    case simpleGrid
    case lazyGrid
}

struct LayoutType: Hashable {
    let name: String
    let color: UIColor
    let layout: ExampleLayout
}

extension LayoutType {
    static let available: [LayoutType] = [
        LayoutType(name: "List Layout", color: .random(), layout: .list),
        LayoutType(name: "Simple Grid Layout", color: .random(), layout: .simpleGrid),
        LayoutType(name: "Lazy Grid Layout", color: .random(), layout: .lazyGrid),
    ]
}
