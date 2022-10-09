//
//  Color.swift
//  DiffableDataSource Demo
//
//  Created by Tai Chin Huang on 2022/10/5.
//

import UIKit

struct Color {
    let id = UUID()
    let color = UIColor.random()
}

extension Color: Hashable, Equatable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Color, rhs: Color) -> Bool {
        return lhs.id == rhs.id
    }
}
