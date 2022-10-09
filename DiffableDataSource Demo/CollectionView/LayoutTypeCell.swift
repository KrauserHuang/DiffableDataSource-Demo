//
//  LayoutTypeCell.swift
//  DiffableDataSource Demo
//
//  Created by Tai Chin Huang on 2022/10/6.
//

import UIKit

class LayoutTypeCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 37, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 1
        return label
    }()
//    private var titleLabel: UILabel!
    private var originalBackgroundColor: UIColor!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        contentView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
//        titleLabel = UILabel()
//        titleLabel.font = .systemFont(ofSize: 37, weight: .bold)
//        titleLabel.textColor = .white
//        titleLabel.numberOfLines = 1
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.layer.zPosition = 1
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
    }
    
    func configure(with layout: LayoutType) {
        titleLabel.text = layout.name
        configure(color: layout.color)
    }
    
    private func configure(color: UIColor) {
        originalBackgroundColor = color
        contentView.backgroundColor = originalBackgroundColor.withAlphaComponent(0.8)
    }
}
